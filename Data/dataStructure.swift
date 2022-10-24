//
//  dataStructure.swift
//  MyTravelmate
//
//  Created by WIP Team on 18/10/22.
//

import Foundation
import SwiftUI

struct filterType: Identifiable {
    var id = UUID()
    var name : String
    var status : Bool
}

struct infoType: Codable {
    var title: String
    var description : String
}

struct cityType: Identifiable,Codable {
    var id: Int
    var name: String
    var description : String
    var tag : [String]
    var image: String
    var food : [infoType]
    var drink: [infoType]
    var lifestyle: infoType
}

extension Color {
    static let tab = Color("tabColor")
}
