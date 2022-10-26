//
//  myTrip.swift
//  MyTravelmate
//
//  Created by Antonio Avolio on 26/10/22.
//

import SwiftUI

struct myTripView: View {
    @Binding var myTrips : [tripType]
    var body: some View {
        NavigationView{
            List {
                ForEach($myTrips){ $trip in
                    Toggle(isOn:$trip.isDone,label: {Text(trip.city.name)})
                }.onDelete(perform: delete)
                
            }
        }.navigationTitle("My Trip")
    }
    func delete(at offset: IndexSet ) {
        myTrips.remove(atOffsets: offset)
    }
}
