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
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 50)
            } else {
                List {
                    ForEach(shoes) { shoe in
                        HStack {
                            Image(uiImage: UIImage(data: shoe.imageData)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text(shoe.clotheDescription ?? "No description")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .shadow(radius: 2)
                .scrollContentBackground(.hidden)
                .background(Color.white)
            }
        }
        .padding(.bottom, 50)
        .ignoresSafeArea(edges: .bottom)
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
