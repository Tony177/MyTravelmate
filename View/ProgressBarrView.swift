//
//  ProgressBarrView.swift
//  MyTravelmate
//
//  Created by Mattia Golino on 27/10/22.
//

import SwiftUI

struct ProgressBarrView: View {
    
    @Binding var myTrip: [tripType]
    @Binding var progress : Double
    
    var body: some View {
        ZStack{
            switch progress{
            case 0.25...0.49:
                Image("world2").resizable().frame(width: 320, height: 320)
            case 0.50...0.74:
                Image("world3").resizable().frame(width: 320, height: 320)
            case 0.75...1.0:
                Image("world4").resizable().frame(width: 320, height: 320)
            default:
                Image("world1").resizable().frame(width: 320, height: 320)
            }
            Circle().stroke(Color.tabColor.opacity(0.5),lineWidth: 30)
            Circle().trim(from: 0, to: progress).stroke(Color.buttonColor, style: StrokeStyle(
                lineWidth: 30,
                lineCap: .round
            )).rotationEffect(.degrees(-90)).animation(.easeOut, value: progress)
        }.onAppear(){
                switch myTrip.count{
                case 1...4:
                    progress = 0.15
                case 5...9:
                    progress = 0.25
                case 10...12:
                    progress = 0.30
                case 13...14:
                    progress = 0.40
                case 15...16:
                    progress = 0.50
                case 17...19:
                    progress = 0.75
                case 20:
                    progress = 1.0
                default:
                    progress = 0.0
                }
        }
    }
    
}

