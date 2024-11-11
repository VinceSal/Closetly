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
                // Button for WardrobeView
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
                
//                Spacer()
                
                NavigationLink(destination: AccessoriesView()) {
                    HStack {
                        Image(systemName: "sunglasses.fill") // Icona della maglietta
                            .font(.title2)
                            .foregroundColor(.black)

                        Text("Accessories") // Scritta "Shirts"
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
                
                NavigationLink(destination: JacketsView()) {
                    HStack {
                        Image(systemName: "jacket.fill") // Icona della maglietta
                            .font(.title2)
                            .foregroundColor(.black)

                        Text("Jackets") // Scritta "Shirts"
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
                
                NavigationLink(destination: PantsView()) {
                    HStack {
                        Image(systemName: "pant.fill")
                            .font(.title2)
                            .foregroundColor(.black)

                        Text("Jackets") // Scritta "Shirts"
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
                
                NavigationLink(destination: ShoesView()) {
                    HStack {
                        Image(systemName: "shoe.fill")
                            .font(.title2)
                            .foregroundColor(.black)

                        Text("Shoes") // Scritta "Shirts"
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
                
                NavigationLink(destination: SweartshirtsView()) {
                    HStack {
                        Image(systemName: "sweartshirt.fill")
                            .font(.title2)
                            .foregroundColor(.black)

                        Text("Sweartshirts") // Scritta "Shirts"
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
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddClothesView()) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle("Wardrobe")
            .fontWeight(.bold)
            .padding(.top, -230)

        }
    }
}

#Preview {
    WardrobeView()
}
