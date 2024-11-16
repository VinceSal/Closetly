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
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 50)
            } else {
                List {
                    ForEach(sweatshirts) { sweatshirt in
                        HStack {
                            Image(uiImage: UIImage(data: sweatshirt.imageData)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text(sweatshirt.clotheDescription ?? "No description")
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
            let sweatshirt = sweatshirts[index]
            modelContext.delete(sweatshirt) // Delete the item from SwiftData
        }
    }
    
}

#Preview {
    SweatshirtsView()
}
