//
//  AddShoeView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 18/11/24.
//

import SwiftData
import SwiftUI

struct AddShoeView: View {
    @Binding var chooseShoe: Bool
    @Binding var shoeImg: UIImage?
    
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Shoe"
    }) var shoes: [Clothe]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var selectedShoe: Int?
    
    var body: some View {
        NavigationStack {
            if !shoes.isEmpty {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(shoes.indices, id: \.self) { index in
                            Button(action: {
                                selectedShoe = index
                            }) {
                                Image(uiImage: UIImage(data: shoes[index].imageData)!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(12)
                                    .clipped()
                                    .blur(radius: selectedShoe == index ? 5 : 0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(selectedShoe == index ? Color.blue : Color.clear, lineWidth: 3)
                                    )
                            }
                        }
                    }
                    .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            chooseShoe.toggle()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Choose a Shoe")
                            .font(.headline)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Confirm") {
                            if let index = selectedShoe {
                                shoeImg = UIImage(data: shoes[index].imageData)
                            }
                            chooseShoe.toggle()
                        }
                    }
                }
            } else {
                Text("No Shoes Available, add some to create awesome outfits!\n\n😀")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    AddShoeView(chooseShoe: .constant(true), shoeImg: .constant(nil))
}
