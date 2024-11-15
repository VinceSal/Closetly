//
//  AllOutfitsView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 15/11/24.
//

import SwiftUI

struct AllOutfitsView: View {
    var body: some View {
        Text("Welcome to your Outfits page!\n\nClick the + button at the top right to create your outfit.\n\nEnjoy! 🥰")
            .multilineTextAlignment(.center)
            .padding()
            .padding(.bottom, 100)
    }
}

#Preview {
    AllOutfitsView()
}
