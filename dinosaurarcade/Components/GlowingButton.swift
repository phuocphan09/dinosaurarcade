//
//  GlowingButton.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 23/05/2022.
//

import Foundation
import SwiftUI

struct GlowingButton: ButtonStyle {
    
    // Helper structure to decorate CTAs conforming ButtonStyle
    
    // Two major theme is supported: Main and Secondary CTA
    // Pass in "true" to indicate the theme of Main CTA
    let isMainCTA: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isMainCTA ? .blue : .white)
            .foregroundColor(isMainCTA ? .white : .blue)
            .overlay(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .font(.system(size: 15, weight: .bold))
            
    }
}
