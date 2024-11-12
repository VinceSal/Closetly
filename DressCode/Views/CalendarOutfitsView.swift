//
//  CalendarOutfitsView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 12/11/24.
//

import SwiftUI

struct CalendarOutfitsView: View {
    
    @Binding var showOutfits: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Choosing outfits view")
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        showOutfits.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Confirm") {
                        showOutfits.toggle()
                    }
                }
            })
        }
    }
}

#Preview {
    CalendarOutfitsView(showOutfits: .constant(true))
}
