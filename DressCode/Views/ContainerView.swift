//
//  ContentView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 04/11/24.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("hasSeenWelcomeScreen") private var hasSeenWelcomeScreen: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 40)

            Text("Welcome to Tlaxcala")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            VStack(spacing: 15) {
                HStack(spacing: 10) {
                    Image(systemName: "pencil")
                    Text("Track your clothes")
                }
                
                HStack(spacing: 10) {
                    Image(systemName: "list.bullet.rectangle")
                    Text("Manage daily outfits")
                }
                
                HStack(spacing: 10) {
                    Image(systemName: "heart")
                    Text("Find your style")
                }
            }
            .font(.body)

            Spacer()
            
            Button(action: {
                hasSeenWelcomeScreen = true
            }) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
        }
        .padding()
    }
}

struct ContainerView: View {
    @AppStorage("hasSeenWelcomeScreen") private var hasSeenWelcomeScreen: Bool = false

    var body: some View {
        if hasSeenWelcomeScreen {
            TabView {
                ClosetView()
                    .tabItem {
                        Label("Closet", systemImage: "hanger")
                    }
                OutfitsView()
                    .tabItem {
                        Label("Outfits", systemImage: "tshirt")
                    }
                CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
            }
        } else {
            WelcomeView()
        }
    }
}

#Preview {
    ContainerView()
}
