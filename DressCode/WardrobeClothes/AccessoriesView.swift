//
//  AccessoriesView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftData
import SwiftUI

struct AccessoriesView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Accessories"
    }) var accessories: [Clothe]
    
    var body: some View {
        VStack {
            if accessories.isEmpty {
                Text("Start taking pictures of your accessories by clicking the + button on the top right.\n\nHave fun! 🥳")
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 100)
            } else {
                List {
                    ForEach(accessories) { accessorie in
                        Text(accessorie.clotheDescription ?? "No description")
                    }
                    .onDelete(perform: deleteItems)
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let accessorie = accessories[index]
            modelContext.delete(accessorie) // Delete the item from SwiftData
        }
    }
    
}

#Preview {
    AccessoriesView()
}
