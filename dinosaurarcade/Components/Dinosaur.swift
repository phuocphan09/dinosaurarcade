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
    let jumpKey: KeyEquivalent
    
    let color: Color = Color.red
    let jumpHeight: CGFloat = 20
    
    var body: some View {
        
        // The dinosaur
        Image("dinosaur-runner-2")
            .resizable()
            .frame(width: self.width, height: self.height)
            .position(x: dinosaurPosition.x, y: dinosaurPosition.y)
        
        // Mock dinosaur using a rectangle
//        Rectangle()
//            .frame(width: self.width, height: self.height)
//            .foregroundColor(color)
//            .position(x: dinosaurPosition.x, y: dinosaurPosition.y)
        
            .onReceive(game.timer) {a in
                
                withAnimation() {
                    // gravity for dinosaur
                    if (dinosaurPosition.y <= 250 - 10) {
                        dinosaurPosition.y += 10
                    }
                }
                
            }
        
        // Jump button
        Button("Jump") {
            self.jump()
        }
        .keyboardShortcut(jumpKey, modifiers: [])
        .opacity(0) // hide it
        
    }
    
    // When click the arrow up button
    func jump() {
        
        // jumps if only it's on the ground
        if (dinosaurPosition.y == 250) {
            withAnimation() {
                dinosaurPosition.y -= 130
            }
            
        }
        
    }
}
