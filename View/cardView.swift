//
//  cardView.swift
//  MyTravelmate
//
//  Created by WIP Team on 23/10/22.
//

import SwiftUI



struct cardView: View {
    
    @Binding var city: cityType
    @Binding var myTrips: [cityType]
    @State private var buttonState: String = "Lifestyle"
    @State var pressed = false
    
    var body: some View {
        VStack{
            HStack(spacing:20){
                VStack(alignment: .leading){
                    Text("\(city.name)").font(.title).padding()
                    Text("\(city.description)").padding().fixedSize(horizontal: false, vertical: true)
                }
                Image("\(city.image)").resizable().frame(width: 100,height: 100).clipShape(RoundedRectangle(cornerRadius: 15)).padding(.trailing)
            }
            Divider()
            HStack(spacing:30){
                Spacer()
                Button("Lifestyle") {
                    buttonState = "Lifestyle"
                }.font(.title3).foregroundColor(Color.buttonColor)
                Spacer()
                Button("To Do") {
                    buttonState = "To Do"
                }.font(.title3).foregroundColor(Color.buttonColor)
                Spacer()
                Button("Food") {
                    buttonState = "Food"
                }.font(.title3).foregroundColor(Color.buttonColor)
                Spacer()
            }
            Divider()
            switch buttonState {
            case "To Do":
                ScrollView{
                    ForEach(city.toDo){ d in
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(.white).shadow(radius: 10)
                            VStack{
                                Text(d.title).padding().font(.title2).fontWeight(.semibold).frame(maxWidth: .infinity,alignment: .leading)
                                Divider()
                                Text(d.description).padding().fontWeight(.light)
                            }
                        }.padding(.top).padding(.horizontal)
                    }
                }
            case "Food":
                ScrollView{
                    ForEach(city.food){ f in
                        ZStack{
                            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(.white).shadow(radius: 10)
                            VStack{
                                Text(f.title).padding().font(.title2).fontWeight(.semibold).frame(maxWidth: .infinity,alignment: .leading)
                                Divider()
                                Text(f.description).padding().fontWeight(.light)
                            }
                        }.padding(.top).padding(.horizontal)
                    }
                    
                }
            default:
                ScrollView{
                    Text(city.lifestyle.title).padding().font(.title).frame(maxWidth: .infinity,alignment: .leading)
                    Text(city.lifestyle.description).padding()
                }
            }
            Spacer()
            
            Button{
                savedata()
                pressed = true
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                    pressed = false
                }
            } label: {
                VStack(spacing:5){
                    Image(systemName: "plus" ).font(.title).opacity(pressed ? 0.0 : 1.0)
                    Text(pressed ? "Successfully added \(city.name)!" : "Add to my trip")
                }
            }.buttonStyle(CustomBS()).foregroundColor(pressed ? .green : .blue)
        }
    }
    
    func savedata(){
        var found: Bool = false
        for t in myTrips{
            if t.id == city.id {
                found = true
            }}
        if !found {
            myTrips.append(city)
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
}

