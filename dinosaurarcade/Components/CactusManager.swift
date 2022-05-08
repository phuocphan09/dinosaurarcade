//
//  CactusManager.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct CactusManager: View {
    
    let game: IndividualGame
    
    @State private var cactusPosition = CGPoint(x: 500, y: 400)
    
    var body: some View {
        Cactus()
            .position(x: cactusPosition.x, y: cactusPosition.y)
            .onReceive(game.timer) {a in
                
                withAnimation() {
                    // move cactus
                    if (cactusPosition.x > 0) {
                        cactusPosition.x -= 30
                    } else {
                        cactusPosition.x = 500
                    }
                    
                }
                    

            }

    }

}
