//
//  JacketsView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftUICore
import SwiftUI

struct JacketsView: View {
    @EnvironmentObject var wardrobeManager: WardrobeManager

    var body: some View {
        
        Text("Start taking pictures of your jackets by clicking the + button on the top right.\n\nHave fun! 🥳")
            .multilineTextAlignment(.center)
            .padding()
            .padding(.bottom, 100)
        
        List(wardrobeManager.jackets) { item in
            HStack {
                if let image = item.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                VStack(alignment: .leading) {
                    Text(item.color)
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Jackets")
    }
}
