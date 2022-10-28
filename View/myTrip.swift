//
//  myTrip.swift
//  MyTravelmate
//
//  Created by Antonio Avolio on 26/10/22.
//

import SwiftUI

struct myTripView: View {
    
    @Binding var myTrips : [tripType]
    @Binding var city: cityType
    
    var body: some View {
        Divider().overlay(Color.tabColor)
        //NavigationView{
            List {
                ForEach($myTrips){ $trip in
                    /*Toggle(isOn:$trip.isDone,label: {Text(trip.city.name)})*/
                    NavigationLink {
                        cardView(city: $trip.city, myTrips: $myTrips)
                    } label: {
                        HStack(spacing: 20){
                            Toggle(isOn: $trip.isDone) {
                                Text(trip.city.name)
                            }
                        }
                    }

                }.onDelete(perform: delete)
                
            }
        //}.navigationTitle("My Trip")
    }
    func delete(at offset: IndexSet ) {
        myTrips.remove(atOffsets: offset)
    }
}
