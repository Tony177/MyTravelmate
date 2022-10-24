//
//  cardView.swift
//  MyTravelmate
//
//  Created by WIP Team on 23/10/22.
//

import SwiftUI

struct cardView: View {
    @Binding var city: cityType
    var body: some View {
        Text("Hello \(city.name)")
    }
}

