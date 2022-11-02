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
    @State private var buttonState: Int = 0
    @State var pressed = false
    @State var added : Bool = false
    
    var body: some View {
        VStack{
            HStack(){
                VStack(){
                    Text("\(city.name)").font(.title).fontWeight(.bold).frame(maxWidth: .infinity,alignment: .leading)
                    Text("\(city.description)").frame(maxWidth: .infinity,alignment: .leading).fontWeight(.light)
                }.padding()
                Spacer()
                Image("\(city.image)").resizable().frame(width: 120,height: 120).clipShape(RoundedRectangle(cornerRadius: 15)).padding()
            }
            HStack(spacing:30){
                Picker("What do you want to see?", selection: $buttonState){
                    Text("Lifestyle").tag(0)
                    Text("To Do").tag(1)
                    Text("Food").tag(2)
                }.pickerStyle(.segmented).padding()
            }

            switch buttonState {
            case 1:
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
            case 2:
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
                    Text(city.lifestyle.title).padding().font(.title2).fontWeight(.semibold).frame(maxWidth: .infinity,alignment: .leading)
                    Text(city.lifestyle.description).padding()
                }
            }
            Spacer()
            
            Button{
                if(!(savedata())){
                    pressed = true
                }else{
                    added = true
                }
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                    pressed = false
                    added = false
                }
            } label: {
                VStack(spacing:5){
                    Image(systemName: "plus" ).font(.title3).opacity(added ? 0.0 : pressed ? 0.0 : 1.0)
                        Text(added ? "\(city.name) already added" : pressed ? "Successfully added \(city.name)!" : "Add to my trip")
                }
            }.buttonStyle(CustomBS()).foregroundColor(added ? .red : pressed ? .green : .blue)
        }
    }
    
    func savedata()->Bool{
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
        return found
    }
}

