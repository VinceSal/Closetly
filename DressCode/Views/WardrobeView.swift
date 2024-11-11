//
//  WardrobeView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 05/11/24.
//

import SwiftUI

struct WardrobeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Wardrobe")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, -185)
                    .padding(.top, -42)

                // Pulsante per Shirts
                NavigationLink(destination: ShirtsView()) {
                    HStack {
                        Image(systemName: "tshirt.fill") // Icona della maglietta
                            .font(.title2)
                            .foregroundColor(.black)

                        Text("Shirts") // Scritta "Shirts"
                            .font(.title2)
                            .foregroundColor(.black)

                        Spacer() // Spazio per fare in modo che l'icona e il testo siano sulla sinistra
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2)) // Colore di sfondo del bottone
                    .cornerRadius(10) // Raggio degli angoli per arrotondare il bottone
                    .shadow(radius: 5) // Ombra per il bottone
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddClothesView()) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    WardrobeView()
}
