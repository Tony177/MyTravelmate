//
//  mainView.swift
//  MyTravelmate
//
//  Created by WIP Team on 11/10/22.
//

import SwiftUI
struct MainView: View {
    @State var myTrips : [tripType] = []
    @State private var randomCity: cityType = cityList.randomElement()!
    @State private var progress = 0.0
    var body: some View {
        NavigationView{
            VStack(spacing:40){
                Divider().frame(height: 45).overlay(Color.tabColor)
                Text("Your World!").font(.title).fontWeight(.semibold)
                ZStack(){
                    switch progress{
                    case 0.25...0.49:
                        Image("world2").resizable().frame(width: 320, height: 320)
                    case 0.50...0.74:
                        Image("world3").resizable().frame(width: 320, height: 320)
                    case 0.75...1.0:
                        Image("world4").resizable().frame(width: 320, height: 320)
                    default:
                        Image("world1").resizable().frame(width: 320, height: 320)
                    }
                    ProgressBarrView(progress: progress).frame(width: 350, height: 350)
                }
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
