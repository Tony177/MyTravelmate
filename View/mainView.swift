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
                Rectangle().ignoresSafeArea(edges: .top)
                    .frame(height: 60).foregroundColor(.tab)
                Text("Make your World!").font(.title).fontWeight(.semibold)
                ZStack(){
                    Image("world").resizable().frame(width: 450)
                }
                NavigationLink(destination:FilterView(),label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).frame(width: 200,height: 60)
                        Text("Get started").foregroundColor(.white)
                    }
                })
                NavigationLink("My Trip",destination:EmptyView()).frame(width: 100,height: 40).background(.blue).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white).opacity(presentTrip ? 1 : 0)
            }
        }
    }
}
//.background(Color(UIColor(named:"buttonColor")!))

struct MainViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
