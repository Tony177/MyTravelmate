//
//  mainView.swift
//  MyTravelmate
//
//  Created by WIP Team on 11/10/22.
//

import SwiftUI
struct MainView: View {
    @State var myTrips : [cityType] = {
        do {
        let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("myPastTrip.json")

        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let items = try decoder.decode([cityType].self, from: data)
        return items
    } catch {
        print(error.localizedDescription)
        return []
    }}()
    @State private var randomCity: cityType = cityList.randomElement()!
    @State private var progress = 0.0
    var body: some View {
        NavigationStack{
            VStack(spacing:40){
                Spacer()
                Text("Your World!").font(.title).fontWeight(.semibold)
                progressBarView(myTripCount: .constant(Double(myTrips.count)) , progress: $progress).frame(width: 320, height: 320).preferredColorScheme(.light)
                Spacer()
                HStack(spacing: 10){
                    NavigationLink {
                        cardView(city: $randomCity,myTrips: $myTrips).preferredColorScheme(.light)
                    } label: {
                        Text("Random Choice").font(.title3).frame(width: 160,height: 50).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
                    }.onAppear(){
                        randomCity = cityList.randomElement()!
                    }
                    NavigationLink {
                        myTripView(myTrips:$myTrips, city: $randomCity).preferredColorScheme(.light)
                    } label: {
                        Text("MyTrips").font(.title3).frame(width: 160,height: 50).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
                    }
                }
                NavigationLink {
                    cityView(myTrips: $myTrips).preferredColorScheme(.light)
                } label: {
                    Text("Discover the World").font(.title2).frame(width: 330,height: 70).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
}

struct MainViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView().preferredColorScheme(.light)
    }
}
