//
//  CalendarView.swift
//  DressCode
//
//  Created by Vincenzo Salzano on 08/11/24.
//

import SwiftData
import SwiftUI

struct CalendarView: View {
    
    @State var showOutfits: Bool = false
    @State private var date = Date()
    @Query var outfits: [Outfit]  // Query all outfits
    
    // Store the filtered outfits based on the selected date
    @State private var filteredOutfits: [Outfit] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker(
                    "Select a date:",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .padding()
                .onChange(of: date) { newDate in
                    filterOutfits(for: newDate)  // Filter outfits when the date changes
                }
                
                Text("\(date.formatted(date: .long, time: .omitted)) outfits:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                if filteredOutfits.isEmpty {
                    Spacer()
                    
                    Text("Welcome to your Calendar page!\n\nPlan your daily outfits by choosing them\nfrom the Outfits Page.\n\nClick the + button and let’s start!💪")
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 100)
                    
                    Spacer()
                } else {
                    List {
                        ForEach(filteredOutfits) { outfit in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(outfit.name)
                                        .font(.headline)
                                    Spacer()
                                }
                                
                                VStack {
                                    HStack {
                                        Image(uiImage: UIImage(data: outfit.imageJacket)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        Image(uiImage: UIImage(data: outfit.imageShirt)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        Image(uiImage: UIImage(data: outfit.imageSweatshirt)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                    HStack {
                                        Image(uiImage: UIImage(data: outfit.imagePant)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        Image(uiImage: UIImage(data: outfit.imageShoe)!)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                    .shadow(radius: 2)
                    .scrollContentBackground(.hidden)
                    .background(Color.white)
                }
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
                CalendarOutfitsView(
                    showOutfits: $showOutfits,
                    selectedDate: date,
                    onConfirm: {
                        filterOutfits(for: date) // Refresh filtered outfits
                    }
                )
            })
            .navigationBarTitle("Calendar")
            .onAppear {
                filterOutfits(for: date)  // Filter outfits when the view appears
            }
        }
    }
    
    // Helper function to strip time from Date
    static func dateOnly(_ date: Date) -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        return Calendar.current.date(from: components) ?? date
    }
    
    // Function to filter outfits based on the selected date
    private func filterOutfits(for date: Date) {
        let strippedDate = CalendarView.dateOnly(date)  // Strip time from the selected date
        filteredOutfits = outfits.filter { outfit in
            if let assignedDate = outfit.assignedDate {
                return CalendarView.dateOnly(assignedDate) == strippedDate
            }
            return false
        }
    }
}

#Preview {
    CalendarView()
}
