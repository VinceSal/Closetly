//
//  AddOutfitsView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 15/11/24.
//

import SwiftUI

struct AddOutfitsView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var addingOutfits: Bool
    
    @State var chooseJacket: Bool = false
    @State var chooseShirt: Bool = false
    @State var chooseSweatshirt: Bool = false
    @State var choosePant: Bool = false
    @State var chooseShoe: Bool = false
    
    @State var jacketImg: UIImage?
    @State var shirtImg: UIImage?
    @State var sweatshirtImg: UIImage?
    @State var pantImg: UIImage?
    @State var shoeImg: UIImage?
    
    @State var outfitName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Outfit Name", text: $outfitName)
                    .frame(width: 150)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.gray)
                            .opacity(0.2)
                    )
                    .padding()
                HStack(spacing: 20) {
                    Button {
                        chooseJacket.toggle()
                    } label: {
                        if jacketImg == nil {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .opacity(0.3)
                                    .frame(width: 150, height: 150)
                                Image(systemName: "jacket")
                                    .resizable()
                                    .foregroundStyle(.black)
                                    .frame(width: 130, height: 100)
                            }
                        } else {
                            Image(uiImage: jacketImg!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    Button {
                        chooseShirt.toggle()
                    } label: {
                        if shirtImg == nil {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .opacity(0.3)
                                    .frame(width: 150, height: 150)
                                Image(systemName: "tshirt")
                                    .resizable()
                                    .foregroundStyle(.black)
                                    .frame(width: 130, height: 100)
                            }
                        } else {
                            Image(uiImage: shirtImg!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                HStack(spacing: 20) {
                    Button {
                        chooseSweatshirt.toggle()
                    } label: {
                        if sweatshirtImg == nil {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .opacity(0.3)
                                    .frame(width: 150, height: 150)
                                Image("hoodie")
                                    .resizable()
                                    .frame(width: 130, height: 110)
                            }
                        } else {
                            Image(uiImage: sweatshirtImg!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    Button {
                        choosePant.toggle()
                    } label: {
                        if pantImg == nil {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .opacity(0.3)
                                    .frame(width: 150, height: 150)
                                Image("pant")
                                    .resizable()
                                    .frame(width: 130, height: 110)
                            }
                        } else {
                            Image(uiImage: pantImg!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                Button {
                    chooseShoe.toggle()
                } label: {
                    if shoeImg == nil {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .opacity(0.3)
                                .frame(width: 150, height: 150)
                            Image(systemName: "shoe.2")
                                .resizable()
                                .foregroundStyle(.black)
                                .frame(width: 90, height: 50)
                        }
                    } else {
                        Image(uiImage: shoeImg!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }

            }
            .padding(.bottom, 60)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        addingOutfits.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let jacketData = jacketImg?.jpegData(compressionQuality: 0.8)
                        let shirtData = shirtImg?.jpegData(compressionQuality: 0.8)
                        let sweatshirtData = sweatshirtImg?.jpegData(compressionQuality: 0.8)
                        let pantData = pantImg?.jpegData(compressionQuality: 0.8)
                        let shoeData = shoeImg?.jpegData(compressionQuality: 0.8)
                        let newOutfit = Outfit(name: outfitName, imageJacket: jacketData!, imageShirt: shirtData!, imageSweatshirt: sweatshirtData!, imagePant: pantData!, imageShoe: shoeData!)
                        modelContext.insert(newOutfit)
                        addingOutfits.toggle()
                    }
                    .disabled(outfitName == "" || jacketImg == nil || shirtImg == nil || sweatshirtImg == nil || pantImg == nil || shoeImg == nil)
                }
            })
            .sheet(isPresented: $chooseJacket, content: {
                AddJacketView(chooseJacket: $chooseJacket, jacketImg: $jacketImg)
            })
            .sheet(isPresented: $chooseShirt, content: {
                AddShirtView(chooseShirt: $chooseShirt, shirtImg: $shirtImg)
            })
            .sheet(isPresented: $chooseSweatshirt, content: {
                AddSweatshirtView(chooseSweatshirt: $chooseSweatshirt, sweatshirtImg: $sweatshirtImg)
            })
            .sheet(isPresented: $choosePant, content: {
                AddPantView(choosePant: $choosePant, pantImg: $pantImg)
            })
            .sheet(isPresented: $chooseShoe, content: {
                AddShoeView(chooseShoe: $chooseShoe, shoeImg: $shoeImg)
            })
        }
    }
}

#Preview {
    AddOutfitsView(addingOutfits: .constant(true))
}
