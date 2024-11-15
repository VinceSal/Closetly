//
//  JacketsView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftData
import SwiftUI

struct JacketsView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Jackets"
    }) var jackets: [Clothe]
    
    var body: some View {
        VStack {
            if jackets.isEmpty {
                Text("Start taking pictures of your jackets by clicking the + button on the top right.\n\nHave fun! 🥳")
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 100)
            } else {
                List {
                    ForEach(jackets) { jacket in
                        Text(jacket.clotheDescription ?? "No description")
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
            let jacket = jackets[index]
            modelContext.delete(jacket) // Delete the item from SwiftData
        }
    }
    
}

#Preview {
    JacketsView()
}
