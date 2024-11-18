//
//  AddPantView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 18/11/24.
//

import SwiftData
import SwiftUI

struct AddPantView: View {
    @Binding var choosePant: Bool
    @Binding var pantImg: UIImage?
    
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Pant"
    }) var pants: [Clothe]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var selectedPant: Int?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(pants.indices, id: \.self) { index in
                        Button(action: {
                            selectedPant = index
                        }) {
                            Image(uiImage: UIImage(data: pants[index].imageData)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(12)
                                .clipped()
                                .blur(radius: selectedPant == index ? 5 : 0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(selectedPant == index ? Color.blue : Color.clear, lineWidth: 3)
                                )
                        }
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        choosePant.toggle()
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Choose a Pant")
                        .font(.headline)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Confirm") {
                        if let index = selectedPant {
                            pantImg = UIImage(data: pants[index].imageData)
                        }
                        choosePant.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    AddPantView(choosePant: .constant(true), pantImg: .constant(nil))
}
