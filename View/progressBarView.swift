//
//  progressBarView.swift
//  MyTravelmate
//
//  Created by WIP Team on 27/10/22.
//

import SwiftUI

struct progressBarView: View {
    
    @Binding var myTripCount: Double
    @Binding var progress : Double
    
    var body: some View {
        ZStack{
            switch progress{
            case 0.25...0.49:
                Image("world2").resizable().frame(width: 300, height: 300)
            case 0.50...0.74:
                Image("world3").resizable().frame(width: 300, height: 300)
            case 0.75...1.0:
                Image("world4").resizable().frame(width: 300, height: 300)
            default:
                Image("world1").resizable().frame(width: 300, height: 300)
            }
            Circle().stroke(Color.tabColor.opacity(0.5),lineWidth: 22)
            Circle().trim(from: 0, to: progress).stroke(Color.buttonColor, style: StrokeStyle(
                lineWidth: 22,
                lineCap: .round
            )).rotationEffect(.degrees(-90)).animation(.easeOut, value: progress)
        }.onAppear(){
            progress = Double(round(100*myTripCount/Double(cityList.count)) / 100) // Round number to 2 digits precision ex: 1.24
        }
    }
}


