//
//  SweartshirtsView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftUI

struct SweartshirtsView: View {
    var body: some View {
        Text("Start taking pictures of your sweatshirts by clicking the + button on the top right.\n\nHave fun! 🥳")
            .multilineTextAlignment(.center)
            .padding()
            .padding(.bottom, 100)
    }
}

#Preview {
    SweartshirtsView()
}
