//
//  myTrip.swift
//  MyTravelmate
//
//  Created by WIP Team on 26/10/22.
//

import SwiftUI

struct myTripView: View {
    
    @Binding var myTrips : [cityType]
    @Binding var city: cityType
    
    var body: some View {
        Divider().overlay(Color.tabColor)
        List {
            ForEach($myTrips){ $trip in
                NavigationLink {
                    cardView(city: $trip, myTrips: $myTrips)
                } label: {
                    HStack(spacing: 20){
                        Text(trip.name)
                        
                    }
                }
                
            }.onDelete(perform: delete)
            
        }.navigationTitle("My Trip")
    }
    func delete(at offset: IndexSet ) {
        myTrips.remove(atOffsets: offset)
        do {
               let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                       .appendingPathComponent("myPastTrip.json")
                print(fileURL)
               let encoder = JSONEncoder()
               try encoder.encode(myTrips).write(to: fileURL)
           } catch {
               print(error.localizedDescription)
           }
    }
}
