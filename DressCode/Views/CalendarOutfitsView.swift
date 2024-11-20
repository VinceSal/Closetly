//
//  CalendarOutfitsView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 12/11/24.
//

import SwiftData
import SwiftUI

struct CalendarOutfitsView: View {
    
    @Binding var showOutfits: Bool
    var selectedDate: Date
    var onConfirm: () -> Void
    @Query var outfits: [Outfit]
    @State private var selectedOutfits: [Outfit] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                if !outfits.isEmpty {
                    List {
                        ForEach(outfits) { outfit in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(outfit.name)
                                        .font(.headline)
                                    Spacer()
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
                            .background(
                                selectedOutfits.contains(where: { $0.id == outfit.id })
                                    ? Color.blue.opacity(0.2)
                                    : Color.clear
                            )
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(selectedOutfits.contains(where: { $0.id == outfit.id })
                                            ? Color.blue
                                            : Color.clear, lineWidth: 2)
                            )
                            .onTapGesture {
                                toggleSelection(for: outfit)
                            }
                        }
                    }
                } else {
                    Text("Welcome to the Outfits selection page!\n\nStart by selecting your creating outfits.\n\nEnjoy! 🥰")
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 50)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        showOutfits.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Confirm") {
                        confirmSelection()
                        onConfirm()
                        showOutfits.toggle()
                    }
                }
            })
        }
    }
    
    private func toggleSelection(for outfit: Outfit) {
        if let index = selectedOutfits.firstIndex(where: { $0.id == outfit.id }) {
            selectedOutfits.remove(at: index)
        } else {
            selectedOutfits.append(outfit)
        }
    }
    
    private func confirmSelection() {
        for outfit in selectedOutfits {
            if let index = outfits.firstIndex(where: { $0.id == outfit.id }) {
                outfits[index].assignedDate = selectedDate
            }
        }
    }
}

#Preview {
    CalendarOutfitsView(showOutfits: .constant(true), selectedDate: Date(), onConfirm: {print("outfits confirmed")})
}
