//
//  DinosaurManager.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 30/05/2022.
//

import Foundation
import SwiftUI
import Combine

struct DinosaurManager: View {
    
    // Binding the position of dinosaur with individual game
    // Since the Game needs to compare its position with cactus to determine winning/losing status
    @Binding var dinosaurPosition: CGPoint
    
    // Required parameter for a Dinosaur instance to operate
    let width: CGFloat
    let height: CGFloat
    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let jumpKey: KeyEquivalent
    
    var body: some View {
        
        Dinosaur(width: self.width, height: self.height)
            
            // move dinosaur to initial positio
            .position(x: dinosaurPosition.x, y: dinosaurPosition.y)
            
            // implement the always-on gravity effect for the dinosaur
            .onReceive(self.timer) {a in
                withAnimation() {
                    // if the dinosaur is not on the ground, move it towards the ground
                    if (dinosaurPosition.y <= 250 - 170/8) {
                        dinosaurPosition.y += 170/8
                    }
                    
                }
            }
    
        // implement the keypress by mapping it to a hidden button
        Button("Jump") {
            self.jump()
        }
        .keyboardShortcut(jumpKey, modifiers: [])
        .opacity(0) // trick to hide this button
    }
    
    private func jump() {
        
        // jumps if only it's on the ground
        if (dinosaurPosition.y == 250) {
            withAnimation() { // Add the withAnimation helper to have a smoother transition
                dinosaurPosition.y -= 170
            }
            
        }
        
    }
    
}
