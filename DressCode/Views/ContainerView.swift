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
            NavigationView {
                           WardrobeView()
                       }
                       .tabItem {
                           Label("Wardrobe", systemImage: "hanger")
                       }
                       
            
                       NavigationView {
                           OutfitsView()
                       }
                       .tabItem {
                           Label("Outfits", systemImage: "tshirt")
                       }
            
            NavigationView {
                CalendarView()
            }
            .tabItem {
                Label("Calendar", systemImage: "calendar")
              }
            }
        
         }
    }


#Preview {
    ContainerView()
}
