//
//  cityView.swift
//  MyTravelmate
//
//  Created by WIP Team on 18/10/22.
//

import SwiftUI

struct CityView: View {
    
    @Binding var filterList: [filterType]
    @State var filteredCityList : [cityType] = []
    var body: some View {
        
        let layout = [GridItem(.fixed(CGFloat(200))),GridItem(.flexible()),]
        ScrollView{
            LazyVGrid(columns: layout){
                ForEach($filteredCityList) { $city in
                    VStack{
                        NavigationLink(destination: cardView(city:$city), label: {
                            Image(city.image).resizable().frame(width: 150,height: 150)
                        }).frame(width: 150,height: 150)
                        Text(city.name)
                    }
                }
            }
        }.onAppear{
            var filterOn:[filterType] = checkFilter(filter: filterList)
            if filterOn.isEmpty {
                filteredCityList = cityList
            }else{
                filteredCityList = applyFilter(filtList: &filterOn, cities: cityList)
            }
        }
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

