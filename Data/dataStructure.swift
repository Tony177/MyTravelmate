//
//  dataStructure.swift
//  MyTravelmate
//
//  Created by WIP Team on 18/10/22.
//

import Foundation
import SwiftUI

struct filterType: Identifiable,Equatable {
    var id = UUID()
    var name : String
    var status : Bool
}

struct infoType: Identifiable,Codable {
    var id : Int
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
    static let tabColor = Color("tabColor")
    static let buttonColor = Color("buttonColor")
}
