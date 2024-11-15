//
//  SweartshirtsView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftData
import SwiftUI

struct SweatshirtsView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Sweatshirts"
    }) var sweatshirts: [Clothe]
    
    var body: some View {
        VStack {
            if sweatshirts.isEmpty {
                Text("Start taking pictures of your sweatshirts by clicking the + button on the top right.\n\nHave fun! 🥳")
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 100)
            } else {
                List {
                    ForEach(sweatshirts) { sweatshirt in
                        Text(sweatshirt.clotheDescription ?? "No description")
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
            let sweatshirt = sweatshirts[index]
            modelContext.delete(sweatshirt) // Delete the item from SwiftData
        }
    }
    
}

#Preview {
    SweatshirtsView()
}
