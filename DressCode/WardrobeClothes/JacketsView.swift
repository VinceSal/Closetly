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
        clothe.clotheType == "Jacket"
    }) var jackets: [Clothe]
    
    var body: some View {
        VStack {
            if jackets.isEmpty {
                Text("Start taking pictures of your jackets by clicking the + button on the top right.\n\nHave fun! 🥳")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 50)
            } else {
                List {
                    ForEach(jackets) { jacket in
                        HStack {
                            Image(uiImage: UIImage(data: jacket.imageData)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            Text("\(jacket.color) \(jacket.clotheType)")
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
            let jacket = jackets[index]
            modelContext.delete(jacket) // Delete the item from SwiftData
        }
    }
    
}

#Preview {
    JacketsView()
}
