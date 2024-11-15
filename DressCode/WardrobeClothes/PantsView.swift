//
//  PantsView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftData
import SwiftUI

struct PantsView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Pants"
    }) var pants: [Clothe]
    
    var body: some View {
        VStack {
            if pants.isEmpty {
                Text("Start taking pictures of your pants by clicking the + button on the top right.\n\nHave fun! 🥳")
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 100)
            } else {
                List {
                    ForEach(pants) { pant in
                        Text(pant.clotheDescription ?? "No description")
                    }
                    .onDelete(perform: deleteItems)
                }
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
                .background(Color.white)
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let pant = pants[index]
            modelContext.delete(pant) // Delete the item from SwiftData
        }
    }
    
}

#Preview {
    PantsView()
}
