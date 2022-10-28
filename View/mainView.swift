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
        NavigationView{
            VStack(spacing:40){
                Divider().frame(height: 45).overlay(Color.tabColor)
                Text("Your World!").font(.title).fontWeight(.semibold)
                progressBarView(myTripCount: .constant(Double(myTrips.count)) , progress: $progress).frame(width: 350, height: 350)
                HStack(spacing: 30){
                    NavigationLink("Random Choice",destination: cardView(city: $randomCity,myTrips: $myTrips).onAppear(){
                        randomCity = cityList.randomElement()!
                    }).frame(width: 160,height: 50).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
                    NavigationLink("My Trip",destination:myTripView(myTrips:$myTrips, city: $randomCity)).frame(width: 160,height: 50).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
                }
                Spacer()
                NavigationLink("Discover The Word",destination: cityView(myTrips: $myTrips)).frame(width: 200,height: 70).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
                Spacer()
            }
        }
    }
}

struct MainViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
