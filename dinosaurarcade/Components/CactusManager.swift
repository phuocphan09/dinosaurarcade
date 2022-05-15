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
    
    let width: CGFloat
    let height: CGFloat
    let game: IndividualGame
    
    var body: some View {
        Cactus(width: width, height: height)
        
            .position(x: cactusPosition.x, y: cactusPosition.y)
            .onReceive(game.timer) {a in
                
                // move cactus
                if (cactusPosition.x > 0) {
                    withAnimation() {
                        cactusPosition.x -= 30
                    }
                } else {
                    
                    cactusPosition.x = 500
                }
                

            }

    }

}
