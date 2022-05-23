//
//  GlowingButton.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 23/05/2022.
//

import Foundation
import SwiftUI

struct GlowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .font(.system(size: 15, weight: .bold))
    }
}
