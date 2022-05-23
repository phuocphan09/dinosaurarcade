//
//  CactusManager.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct CactusManager: View {
    
    @Binding var cactusPosition: CGPoint
    @State var cactusXMovement = 30.0
    
    let speed = 1.0 // change to 1.0 if willing to disable the increasing speed feature
    @Binding var width: CGFloat
//    let height: CGFloat
    let game: IndividualGame
    
    var body: some View {
        
        Cactus(width: width, height: 2 * width)
        
            .position(x: cactusPosition.x, y: cactusPosition.y)
            .onReceive(game.timer) {a in
                
                // move cactus if it has not reached the screen border
                if (cactusPosition.x > 0) {
                    
                    withAnimation() {
                        
                        // move the cactus
                        cactusPosition.x -= self.cactusXMovement
                        
                        // increase the speed
                        self.cactusXMovement *= self.speed
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
