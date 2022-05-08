//
//  IndividualGame.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct IndividualGame: View {
    
    // Refresh rate is set to 0.1
    public var timer = Timer.publish(every: 0.08, on: RunLoop.main, in: .common).autoconnect()
    
    var dinosaurSize = ["width": CGFloat(30),
                        "height": CGFloat(30)]
    
    // Size configuration for components
    var dinosaurWidth: CGFloat = 30
    var dinosaurHeight: CGFloat = 30
    var cactusWidth: CGFloat = 10
    var cactusHeight: CGFloat = 120
    
    // The game needs to know the position of its component real-time, hence using binding state
    @State private var cactusPosition = CGPoint(x: 500, y: 400)
    @State private var dinosaurPosition = CGPoint(x: 200, y: 400)
    
    var body: some View {
        
        // render the UI, two components only
        ZStack {
            
            Dinosaur(dinosaurPosition: self.$dinosaurPosition, width: self.dinosaurWidth, height: self.dinosaurHeight, game: self)
            
            CactusManager(cactusPosition: self.$cactusPosition, width: self.cactusWidth, height: self.cactusHeight, game: self)
                
        }
        
        // check for collision
        .onReceive(timer) {a in
            self.collisionCheck()
        }
        
    }
    
    
    func collisionCheck() {
        
//        print(self.dinosaurPosition)
//        print(self.cactusPosition)
        
        if (abs(cactusPosition.x - dinosaurPosition.x) <= (cactusWidth + dinosaurWidth) / 2) && (abs(cactusPosition.y - dinosaurPosition.y) <= (cactusHeight + dinosaurHeight) / 2) {
            
            self.stop()
            
        }
        
    }
    
    // stop the game when collison is made
    func stop() {
        self.timer.upstream.connect().cancel()
    }
    
    
}
