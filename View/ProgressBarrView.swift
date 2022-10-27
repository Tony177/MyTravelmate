//
//  ProgressBarrView.swift
//  MyTravelmate
//
//  Created by Mattia Golino on 27/10/22.
//

import SwiftUI

struct ProgressBarrView: View {
    let progress : Double
    var body: some View {
        Circle().stroke(Color.tabColor.opacity(0.5),lineWidth: 30)
        Circle().trim(from: 0, to: progress).stroke(Color.buttonColor, style: StrokeStyle(
            lineWidth: 30,
            lineCap: .round
        )).rotationEffect(.degrees(-90)).animation(.easeOut, value: progress)
    }
}

