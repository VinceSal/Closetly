//
//  CalendarView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftUI

struct CalendarView: View {
    
    @State var showOutfits: Bool = false
    @State private var date = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker(
                    "Select a date:",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .padding()
                
                Text("\(date.formatted(date: .long, time: .omitted)) outfits:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Spacer()
                
                Text("Welcome to your Calendar page!\n\nPlan your daily outfits by choosing them\nfrom the Outfits Page.\n\nClick the + button and let’s start!💪")
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 100)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showOutfits.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
            .sheet(isPresented: $showOutfits, content: {
                CalendarOutfitsView(showOutfits: $showOutfits)
            })
            .navigationBarTitle("Calendar")
        }
    }
}

#Preview {
    CalendarView()
}
