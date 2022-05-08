//
//  Dinosaur.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct Dinosaur: View {
    
    @State private var dinosaurPosition = CGPoint(x: 200, y: 400)
    
    let game: IndividualGame
    let size: CGFloat = 30
    let color: Color = Color.red
    
    var body: some View {
        
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
            .position(x: dinosaurPosition.x, y: dinosaurPosition.y)
            .onReceive(game.timer) {a in
                
                withAnimation() {
                    // gravity for dinosaur
                    if (dinosaurPosition.y <= 380) {
                        dinosaurPosition.y += 20
                    }
                }
                
            }
        
        
        Button("Jump") {
            self.jump()
        }
        .keyboardShortcut(KeyEquivalent.upArrow, modifiers: [])
        
    }
    
    // When click the arrow up button
    func jump() {
        
        // jumps if only it's on the ground
        if (dinosaurPosition.y == 400) {
            dinosaurPosition.y -= 120
        }
        
    }
}
