//
//  AddOutfitsView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 15/11/24.
//

import SwiftUI

struct AddOutfitsView: View {
    
    @Binding var addingOutfits: Bool
    
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
                        print("This is a button")
                    } label: {
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
                    }
                    Button {
                        print("This is a button")
                    } label: {
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
                    }
                }
                HStack(spacing: 20) {
                    Button {
                        print("This is a button")
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .opacity(0.3)
                                .frame(width: 150, height: 150)
                            Image("hoodie")
                                .resizable()
                                .frame(width: 130, height: 110)
                        }
                    }
                    Button {
                        print("This is a button")
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .opacity(0.3)
                                .frame(width: 150, height: 150)
                            ZStack(alignment: .trailing) {
                                Image(systemName: "square")
                                    .bold()
                                    .frame(width: 42)
                                    .font(.system(size: 20))
                                    .foregroundStyle(.black)
                                    .padding(.bottom, 51)
                                HStack(spacing: -27) {
                                    Image(systemName: "rectangle.portrait")
                                        .font(.system(size: 70))
                                        .foregroundColor(.black)
                                    Image(systemName: "rectangle.portrait")
                                        .font(.system(size: 70))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
                Button {
                    print("This is a button")
                } label: {
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
                        addingOutfits.toggle()
                    }
                }
            })
        }
    }
}

#Preview {
    AddOutfitsView(addingOutfits: .constant(true))
}
