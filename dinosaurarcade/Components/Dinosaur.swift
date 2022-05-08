//
//  Dinosaur.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct Dinosaur: View {
    
    @Binding var dinosaurPosition: CGPoint
    let width: CGFloat
    let height: CGFloat
    let game: IndividualGame
    
    let color: Color = Color.red
    let jumpHeight: CGFloat = 20
    
    var body: some View {
        
        Rectangle()
            .frame(width: self.width, height: self.height)
            .foregroundColor(color)
            .position(x: dinosaurPosition.x, y: dinosaurPosition.y)
            .onReceive(game.timer) {a in
                
                withAnimation() {
                    // gravity for dinosaur
                    if (dinosaurPosition.y <= 400 - 20) {
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
            withAnimation() {
                dinosaurPosition.y -= 120
            }
            
        }
        
    }
}
