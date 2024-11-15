//
//  ShirtsView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftData // to use swiftData
import SwiftUI

struct ShirtsView: View {
    
    @Environment(\.modelContext) var modelContext // Calling the swiftData container to a environment variable, to add, edit or delete stuff from the container
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Shirts"
    }) var shirts: [Clothe] // iterates through the array of clothes and filters the ones that are shirt type
    
    var body: some View {
        VStack {
            if shirts.isEmpty {
                Text("Start taking pictures of your shirts by clicking the + button on the top right.\n\nHave fun! 🥳")
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 100)
            } else {
                List {
                    ForEach(shirts) { shirt in
                        Text(shirt.clotheDescription ?? "No description")
                    }
                    .onDelete(perform: deleteItems)
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let shirt = shirts[index]
            modelContext.delete(shirt) // Delete the item from SwiftData
        }
    }
    
}

#Preview {
    ShirtsView()
}
