//
//  AllOutfitsView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 15/11/24.
//

import SwiftData
import SwiftUI

struct AllOutfitsView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var outfits: [Outfit]
    
    var body: some View {
        VStack {
            if outfits.isEmpty {
                Text("Welcome to your Outfits page!\n\nClick the + button at the top right to create your outfit.\n\nEnjoy! 🥰")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.bottom, 100)
            } else {
                List {
                    ForEach(outfits) { outfit in
                        HStack {
                            Text("\(outfit.name) works 😃")
                        }
                    }.onDelete(perform: deleteItems)
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
            let outfit = outfits[index]
            modelContext.delete(outfit) // Delete the item from SwiftData
        }
    }
    
}

#Preview {
    AllOutfitsView()
}
