//
//  AddOutfitsView.swift
//  DressCode
//
//  Created by Rubén Kumar Tandon Ramirez on 15/11/24.
//

import SwiftUI

struct AddOutfitsView: View {
    
    @Binding var addingOutfits: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Add Outfits")
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        addingOutfits.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        addingOutfits.toggle()
                    }
                }
            })
        }
    }
}

#Preview {
    AddOutfitsView(addingOutfits: .constant(true))
}
