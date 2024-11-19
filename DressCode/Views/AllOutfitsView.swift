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
        NavigationStack {
            VStack {
                if outfits.isEmpty {
                    Text("Welcome to your Outfits page!\n\nClick the + button at the top right to create your outfit.\n\nEnjoy! 🥰")
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 50)
                } else {
                    List {
                        ForEach(outfits) { outfit in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(outfit.name)
                                        .font(.headline)
                                    Spacer()
                                    Button(action: {
                                        toggleFavorite(outfit)
                                    }) {
                                        Image(systemName: outfit.isFavorite ? "star.fill" : "star")
                                            .foregroundColor(outfit.isFavorite ? .yellow : .gray)
                                    }
                                    .buttonStyle(.plain)
                                }
                                
                                VStack {
                                    HStack {
                                        Image(uiImage: UIImage(data: outfit.imageJacket)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        Image(uiImage: UIImage(data: outfit.imageShirt)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        Image(uiImage: UIImage(data: outfit.imageSweatshirt)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                    HStack {
                                        Image(uiImage: UIImage(data: outfit.imagePant)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        Image(uiImage: UIImage(data: outfit.imageShoe)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                }
                            }
                            .padding()
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
    }
    
    func toggleFavorite(_ outfit: Outfit) {
        outfit.isFavorite.toggle()
        try? modelContext.save()
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let outfit = outfits[index]
            modelContext.delete(outfit)
        }
    }
}

#Preview {
    AllOutfitsView()
}
