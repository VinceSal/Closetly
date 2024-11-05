//
//  ContentView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 04/11/24.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        TabView {
            Tab("Wardrobe", systemImage: "hanger") {
                WardrobeView()
            }
            Tab("Outfits", systemImage: "tshirt") {
                OutfitsView()
            }
        }
    }
}

#Preview {
    ContainerView()
}
