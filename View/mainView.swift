//
//  mainView.swift
//  MyTravelmate
//
//  Created by WIP Team on 11/10/22.
//

import SwiftUI
struct MainView: View {
    @State private var presentTrip = true
    var body: some View {
        NavigationView{
            VStack(spacing:40){
                Divider().frame(height: 45).overlay(.gray)
//                Rectangle().ignoresSafeArea(edges: .top)
//                    .frame(height: 60).foregroundColor(.tab)
                Text("Make your World!").font(.title).fontWeight(.semibold)
                ZStack(){
                    Image("world").resizable().frame(width: 320)
                }
                NavigationLink(destination:cityView(),label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).frame(width: 200,height: 60)
                        Text("Discover the world").foregroundColor(.white)
                    }
                })
                
                NavigationLink("Random Choice",destination: EmptyView()).frame(width: 160,height: 50).background(.blue).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
                NavigationLink("My Trip",destination:EmptyView()).frame(width: 100,height: 40).background(.blue).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white).opacity(presentTrip ? 1 : 0)
            }
        }
    }
}

/*
 TODO
 1. Implementare random scelta per Random Choice e sceglierne le dimensioni
 2. Ridefinire design della city card
 */

struct MainViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
