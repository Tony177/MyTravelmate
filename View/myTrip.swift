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
        List {
            Section(header:Text("Visited Places")){
                ForEach($myTrips){ $trip in
                    NavigationLink {
                        cardView(city: $trip, myTrips: $myTrips).preferredColorScheme(.light)
                    } label: {
                        HStack(spacing: 20){
                            Text(trip.name)
                        }
                    }
                    
                }.onDelete(perform: delete)
            }
        }.navigationTitle("My Trips")
    }
    func delete(at offset: IndexSet ) {
        myTrips.remove(atOffsets: offset)
        do {
               let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                       .appendingPathComponent("myPastTrip.json") 
               let encoder = JSONEncoder()
               try encoder.encode(myTrips).write(to: fileURL)
           } catch {
               print(error.localizedDescription)
           }
    }
}
