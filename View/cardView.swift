//
//  cardView.swift
//  MyTravelmate
//
//  Created by WIP Team on 23/10/22.
//

import SwiftUI

struct cardView: View {
    
    @Binding var city: cityType
    @Binding var myTrips: [tripType]
    @State private var buttonState: String = "Lifestyle"
    
    var body: some View {
        
        VStack{
            Divider().overlay(Color.tabColor)
            HStack(spacing:20){
                VStack(){
                    Text("\(city.name)").font(.title)
                    Text("\(city.description)")
                }
                Image("\(city.image)").resizable().frame(width: 100,height: 100).clipShape(RoundedRectangle(cornerRadius: 15))
            }
            Divider()
            HStack(spacing:30){
                Button("Lifestyle") {
                    buttonState = "Lifestyle"
                }.font(.title2)
                Button("Drink") {
                    buttonState = "Drink"
                }.font(.title2)
                Button("Food") {
                    buttonState = "Food"
                }.font(.title2)
            }
            Divider()
            switch buttonState {
            case "Drink":
                ForEach(city.drink){ d in
                    Text("\(d.title)").padding().font(.title2).fontWeight(.semibold)
                    Text("\(d.description)").padding()
                }
            case "Food":
                ForEach(city.food){ f in
                    Text("\(f.title)").padding().font(.title2).fontWeight(.semibold)
                    Text("\(f.description)").padding()
                }
            default:
                Text("\(city.lifestyle.title)").padding().font(.title2).fontWeight(.semibold)
                Text("\(city.lifestyle.description)").padding()
            }
            Spacer()
            Button{
                var found: Bool = false
                for t in myTrips{
                    if t.city.id == city.id {
                        found = true
                    }}
                if found == false {
                    myTrips.append(tripType(city: city, isDone: false))
                }
                
            } label: {
                VStack(spacing:5){
                    Image(systemName: "plus").font(.title)
                    Text("Add to my trip")
                }
            }
        }
    }
}
