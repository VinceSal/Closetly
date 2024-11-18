//
//  OutfitsView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 05/11/24.
//

import SwiftUI

struct OutfitsView: View {
    
    @State var addingOutfits: Bool = false
    @State private var selectedSegment = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Picker("Select tab", selection: $selectedSegment) {
                    Text("All").tag(0)
                    Text("Favorites").tag(1)
                }
                .pickerStyle(.segmented)
                .colorMultiply(.blue)
                .padding()
                
                TabView(selection: $selectedSegment) {
                    AllOutfitsView()
                        .tag(0)
                    FavoriteOutfitsView()
                        .tag(1)
                }
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addingOutfits.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.bottom, 80)
            .navigationTitle("Outfits")
            .fontWeight(.bold)
            .fullScreenCover(isPresented: $addingOutfits) {
                AddOutfitsView(addingOutfits: $addingOutfits)
            }
            
        }
    }
}

#Preview {
    OutfitsView()
}
