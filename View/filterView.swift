//
//  filterView.swift
//  MyTravelmate
//
//  Created by WIP Team on 18/10/22.
//

import SwiftUI

struct FilterView: View {
    @State var filterList : [filterType] = [filterType(name:"Culture", status:  false),filterType(name:"Summer", status: false),filterType(name:"Winter", status: false),filterType(name:"Nightlife", status: false)]
    var body: some View {
        VStack(){
            ForEach($filterList) { $elem in
                Toggle(elem.name,isOn: $elem.status)
            }.padding()
            NavigationLink("Apply Filter",destination:CityView(filterList: $filterList)).frame(width: 200,height: 60).background(.blue).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
            Spacer()
            Text("If you don't know what to choose")
            NavigationLink("Random Destination",destination:EmptyView()).frame(width: 200,height: 60).background(.blue).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white)
            
        }.navigationTitle("Filter List")
    }
}

struct FilterPreview: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

