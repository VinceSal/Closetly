//
//  WardrobeView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 05/11/24.
//

import SwiftUI

struct WardrobeView: View {
    
    @State var addingClothes: Bool = false
    
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
                        Image(systemName: "coat.fill") // Icona della maglietta
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
                        ZStack(alignment: .trailing) {
                            Image(systemName: "square")
                                .frame(width: 16)
                                .font(.system(size: 8))
                                .foregroundStyle(.black)
                                .padding(.bottom, 11)
                            HStack(spacing: -9) {
                                Image(systemName: "rectangle.portrait")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                Image(systemName: "rectangle.portrait")
                                    .font(.title3)
                                    .foregroundColor(.black)
                            }
                        }

                        Text("Pants") // Scritta "Shirts"
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
                
                NavigationLink(destination: SweatshirtsView()) {
                    HStack {
                        Image(systemName: "jacket")
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
                    Button {
                        addingClothes.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle("Closets")
            .fontWeight(.bold)
            .padding(.top, -230)
            .fullScreenCover(isPresented: $addingClothes) {
                AddClothesView(addingClothes: $addingClothes)
            }
            
        }
    }
}

#Preview {
    WardrobeView()
}
