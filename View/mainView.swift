//
//  mainView.swift
//  MyTravelmate
//
//  Created by WIP Team on 11/10/22.
//

import SwiftUI
struct MainView: View {
    @State private var presentTrip = true
    @State private var randomCity: cityType = cityList.randomElement()!
    var body: some View {
        NavigationView{
            VStack(spacing:40){
                Divider().frame(height: 45).overlay(Color.tabColor)
                Text("Your World!").font(.title).fontWeight(.semibold)
                ZStack(){
                    Image("world").resizable().frame(width: 320, height: 320)
                    //Text("0%").font(.title).bold().foregroundColor(.white)
                }
                HStack(spacing: 30){
                    NavigationLink("Random Choice",destination: cardView(city: $randomCity).onAppear(){
                        randomCity = cityList.randomElement()!
                    }).frame(width: 160,height: 50).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
                    NavigationLink("My Trip",destination:EmptyView()).frame(width: 160,height: 50).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white).opacity(presentTrip ? 1 : 0)
                }
                Spacer()
                NavigationLink("Discover The Word",destination: cityView()).frame(width: 200,height: 70).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
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
