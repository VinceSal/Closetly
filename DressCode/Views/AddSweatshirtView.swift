//
//  AddSweatshirtView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 18/11/24.
//

import SwiftData
import SwiftUI

struct AddSweatshirtView: View {
    @Binding var chooseSweatshirt: Bool
    @Binding var sweatshirtImg: UIImage?
    
    @Query(filter: #Predicate<Clothe> { clothe in
        clothe.clotheType == "Sweatshirt"
    }) var sweatshirts: [Clothe]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var selectedSweatshirt: Int?
    
    var body: some View {
        NavigationStack {
            if !sweatshirts.isEmpty {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(sweatshirts.indices, id: \.self) { index in
                            Button(action: {
                                selectedSweatshirt = index
                            }) {
                                Image(uiImage: UIImage(data: sweatshirts[index].imageData)!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(12)
                                    .clipped()
                                    .blur(radius: selectedSweatshirt == index ? 5 : 0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(selectedSweatshirt == index ? Color.blue : Color.clear, lineWidth: 3)
                                    )
                            }
                        }
                    }
                    .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            chooseSweatshirt.toggle()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Choose a Sweatshirt")
                            .font(.headline)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Confirm") {
                            if let index = selectedSweatshirt {
                                sweatshirtImg = UIImage(data: sweatshirts[index].imageData)
                            }
                            chooseSweatshirt.toggle()
                        }
                    }
                }
            } else {
                Text("No Sweatshirts Available, add some to create awesome outfits!\n\n😀")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    AddSweatshirtView(chooseSweatshirt: .constant(true), sweatshirtImg: .constant(nil))
}
