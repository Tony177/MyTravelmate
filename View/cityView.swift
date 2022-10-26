//
//  cityView.swift
//  MyTravelmate
//
//  Created by WIP Team on 18/10/22.
//

import SwiftUI

struct cityView: View {
    let layout = [GridItem(.fixed(CGFloat(200))),GridItem(.flexible()),]
    @State private var filteredCityList : [cityType] = cityList
    @State private var filterList : [filterType] = [filterType(name:"Culture", status:  false),filterType(name:"Summer", status: false),filterType(name:"Winter", status: false),filterType(name:"Nightlife", status: false)]
    
    var body: some View {
        
        VStack(spacing:5){
            Divider().overlay(Color.tabColor)
            ScrollView(.horizontal){
                HStack(spacing:20){
                    ForEach($filterList) { $f in
                        ZStack{
                            Toggle(f.name, isOn: $f.status).toggleStyle(.button).tint(Color.buttonColor)
                        }
                    }
                }
            }
            Divider()
            ScrollView{
                LazyVGrid(columns: layout){
                    ForEach($filteredCityList) { $city in
                        VStack{
                            NavigationLink(destination: cardView(city:$city), label: {
                                Image(city.image).resizable().frame(width: 150,height: 150)
                            }).frame(width: 150,height: 150).clipShape(RoundedRectangle(cornerRadius: 15))
                            Text(city.name)
                        }
                    }
                }.onChange(of: filterList, perform: { filterList in
                    var filterOn:[filterType] = checkFilter(filter: filterList)
                    if filterOn.isEmpty {
                        filteredCityList = cityList
                    }else{
                        filteredCityList = applyFilter(filtList: &filterOn, cities: cityList)
                    }
                    
                })
            }
            
        }
    }
}


struct CityViewPreviews: PreviewProvider {
    static var previews: some View {
        cityView()
    }
}

func filterChoice(filteredCityList: inout [cityType],filterList:[filterType]) ->  Void{
    var filterOn:[filterType] = checkFilter(filter: filterList)
    if filterOn.isEmpty {
        filteredCityList = cityList
    }else{
        filteredCityList = applyFilter(filtList: &filterOn, cities: cityList)
    }
}

func checkFilter(filter: [filterType])->[filterType]{
    var filterTrueList:[filterType] = []
    for f in filter {
        if f.status == true{
            filterTrueList.append(f)
        }
    }
    return filterTrueList
}

func applyFilter(filtList: inout [filterType], cities: [cityType]) -> [cityType]{
    var citiesFiltered : [cityType] = []
    for c in cities {
        if c.tag.contains(filtList[0].name){
            citiesFiltered.append(c)
        }
    }
    
    filtList.removeFirst()
    if filtList.isEmpty || citiesFiltered.isEmpty {
        return citiesFiltered
    }
    return applyFilter(filtList: &filtList, cities: citiesFiltered)
    
}

