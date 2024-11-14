//
//  ShoesView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftData
import SwiftUI

struct ShoesView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Shoes"
    }) var shoes: [Clothe]
    
    var body: some View {
        VStack {
            if shoes.isEmpty {
                Text("Start taking pictures of your shoes by clicking the + button on the top right.\n\nHave fun! 🥳")
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 100)
            } else {
                List {
                    ForEach(shoes) { shoe in
                        Text(shoe.clotheDescription ?? "No description")
                    }
                    .onDelete(perform: deleteItems)
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let shoe = shoes[index]
            modelContext.delete(shoe) // Delete the item from SwiftData
        }
    }
    
}

#Preview {
    ShoesView()
}
