//
//  CactusManager.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct CactusManager: View {
    
    // Binding the position of dinosaur with individual game
    // Since the Game needs to compare its position with cactus to determine winning/losing status
    @Binding var cactusPosition: CGPoint
    @Binding var speed: Double // increase the moving speed of a cactus after each jump
    @Binding var width: CGFloat // randomize the size of a cactus after each jump
    
    // configuration
    let cactusXMovement = 30.0
    let increasingSpeed = 1.0 // change to 1.0 if willing to disable the speed increasing difficulty

    let game: IndividualGame
    
    var body: some View {
        
        Cactus(width: width, height: 2 * width)
        
            .position(x: cactusPosition.x, y: cactusPosition.y)
            .onReceive(game.timer) {a in
                
                // move cactus if it has not reached the screen border
                if (cactusPosition.x > 0) {
                    
                    withAnimation() {
                        
                        // move the cactus
                        cactusPosition.x -= self.cactusXMovement * self.speed
                        
                        self.speed *= self.increasingSpeed
                        
                    }
                    
                } else {
                    
                    // reached screen border
                    cactusPosition.x = 450
                    
                    // randomize the size of next cactus
                    width = CGFloat(40 * Int.random(in: 50..<150) / 100)
                    
                }
                

            }

    }

}
