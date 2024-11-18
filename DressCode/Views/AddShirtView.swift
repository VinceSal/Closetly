//
//  AddTshirtView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 18/11/24.
//

import SwiftData
import SwiftUI

struct AddShirtView: View {
    @Binding var chooseShirt: Bool
    @Binding var shirtImg: UIImage?
    
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Shirt"
    }) var shirts: [Clothe]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var selectedShirt: Int?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(shirts.indices, id: \.self) { index in
                        Button(action: {
                            selectedShirt = index
                        }) {
                            Image(uiImage: UIImage(data: shirts[index].imageData)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(12)
                                .clipped()
                                .blur(radius: selectedShirt == index ? 5 : 0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(selectedShirt == index ? Color.blue : Color.clear, lineWidth: 3)
                                )
                        }
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        chooseShirt.toggle()
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Choose a Shirt")
                        .font(.headline)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Confirm") {
                        if let index = selectedShirt {
                            shirtImg = UIImage(data: shirts[index].imageData)
                        }
                        chooseShirt.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    AddShirtView(chooseShirt: .constant(true), shirtImg: .constant(nil))
}
