//
//  cardView.swift
//  MyTravelmate
//
//  Created by WIP Team on 23/10/22.
//

import SwiftUI

struct cardView: View {
    @Binding var city: cityType
    @State var buttonState: String = "Lifestyle"
    var body: some View {
        VStack{
            HStack(spacing:20){
                VStack(spacing:20){
                    Text("\(city.name)").font(.title)
                    Text("\(city.description)")
                }
                Image("\(city.image)").resizable().frame(width: 100,height: 100)
            }
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
            switch buttonState {
            case "Drink":
                ForEach(city.drink){ d in
                    Text("\(d.title)")
                    Text("\(d.description)")
                }
            case "Food":
                ForEach(city.food){ f in
                    Text("\(f.title)")
                    Text("\(f.description)")
                }
            default:
                Text("\(city.lifestyle.description)")
            }
        }
    }
}
