//
//  WardrobeView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 05/11/24.
//

import SwiftUI

struct ClosetView: View {
    
    @State var addingClothes: Bool = false
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Select items", selection: $selectedSegment) {
                    Text("Jackets").tag(0)
                    Text("Sweatshirts").tag(1)
                    Text("Shirts").tag(2)
                    Text("Pants").tag(3)
                    Text("Shoes").tag(4)
                }
                .pickerStyle(.segmented)
                .colorMultiply(.blue)
                .padding(.horizontal)
                .padding(.top)
                
                TabView(selection: $selectedSegment) {
                    JacketsView()
                        .tag(0)
                    SweatshirtsView()
                        .tag(1)
                    ShirtsView()
                        .tag(2)
                    PantsView()
                        .tag(3)
                    ShoesView()
                        .tag(4)
                }
                Spacer()
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
            .navigationTitle("Closet")
            .fontWeight(.bold)
            .fullScreenCover(isPresented: $addingClothes) {
                AddClothesView(addingClothes: $addingClothes)
            }
            
        }
    }
}

#Preview {
    ClosetView()
}
