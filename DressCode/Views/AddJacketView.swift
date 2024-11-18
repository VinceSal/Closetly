//
//  AddShoe.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 18/11/24.
//

import SwiftData
import SwiftUI

struct AddJacketView: View {
    
    @Binding var chooseJacket: Bool
    @Binding var jacketImg: UIImage?
    
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Jacket"
    }) var jackets: [Clothe]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var selectedJacket: Int?
    
    var body: some View {
        NavigationStack {
            if !jackets.isEmpty {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(jackets.indices, id: \.self) { index in
                            Button(action: {
                                selectedJacket = index
                            }) {
                                Image(uiImage: UIImage(data: jackets[index].imageData)!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(12)
                                    .clipped()
                                    .blur(radius: selectedJacket == index ? 5 : 0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(selectedJacket == index ? Color.blue : Color.clear, lineWidth: 3)
                                    )
                            }
                        }
                    }
                    .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            chooseJacket.toggle()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Choose a Jacket")
                            .font(.headline)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Confirm") {
                            if let index = selectedJacket {
                                jacketImg = UIImage(data: jackets[index].imageData)
                            }
                            chooseJacket.toggle()
                        }
                    }
                }
            } else {
                Text("No Jackets Available, add some to create awesome outfits!\n\n😀")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    AddJacketView(chooseJacket: .constant(true), jacketImg: .constant(nil))
}
