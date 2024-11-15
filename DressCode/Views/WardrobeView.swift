//
//  WardrobeView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 05/11/24.
//

import SwiftUI

struct WardrobeView: View {
    
    @State var addingClothes: Bool = false
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Picker("Select items", selection: $selectedSegment) {
                    Text("Shirts").tag(0)
                    Text("Accessories").tag(1)
                    Text("Jackets").tag(2)
                    Text("Pants").tag(3)
                    Text("Shoes").tag(4)
//                    Text("Sweatshirts").tag(5)
                }
                .pickerStyle(.segmented)
                .colorMultiply(.blue)
                .padding()
                
                TabView(selection: $selectedSegment) {
                    ShirtsView()
                        .tag(0)
                    AccessoriesView()
                        .tag(1)
                    JacketsView()
                        .tag(2)
                    PantsView()
                        .tag(3)
                    ShoesView()
                        .tag(4)
//                    SweatshirtsView()
//                        .tag(5)
                }
                .frame(width:350, height: 500)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.blue, lineWidth: 2)
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addingClothes.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.bottom, 80)
            .navigationTitle("Wardrobe")
            .fontWeight(.bold)
            .fullScreenCover(isPresented: $addingClothes) {
                AddClothesView(addingClothes: $addingClothes)
            }
            
        }
    }
}

#Preview {
    WardrobeView()
}
