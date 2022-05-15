//
//  IndividualGame.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI
import Combine

struct IndividualGame: View {
    
    // Input key to control
    let playerID: Int
    let jumpKey: KeyEquivalent
//    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    let timer = Timer.publish(every: 0.08, on: RunLoop.main, in: .common).autoconnect()
    @Binding var manager: TwoPlayerManager
    
    
    let dinosaurSize = ["width": CGFloat(30),
                        "height": CGFloat(30)]
    
    // Size configuration for components
    var dinosaurWidth: CGFloat = 30
    var dinosaurHeight: CGFloat = 30
    var cactusWidth: CGFloat = 10
    var cactusHeight: CGFloat = 120
    
    // The game needs to know the position of its component real-time, hence using binding state
    let initialCactusPosition = ["x": 500, "y": 400]
    let initialDinosaurPosition = ["x": 200, "y": 400]
    @State private var cactusPosition = CGPoint(x: 500, y: 400)
    @State private var dinosaurPosition = CGPoint(x: 200, y: 400)
    
    var body: some View {
        
        // render the UI, two components only
        ZStack {
            
            Dinosaur(dinosaurPosition: self.$dinosaurPosition, width: self.dinosaurWidth, height: self.dinosaurHeight, game: self, jumpKey: jumpKey)
            
            CactusManager(cactusPosition: self.$cactusPosition, width: self.cactusWidth, height: self.cactusHeight, game: self)
                
        }
        
        // check for collision
        .onReceive(timer) {a in
            self.collisionCheck()
        }
        
    }
    
    
    func collisionCheck() {
        
        // Check for collision
        
        if (abs(cactusPosition.x - dinosaurPosition.x) <= (cactusWidth + dinosaurWidth) / 2) && (abs(cactusPosition.y - dinosaurPosition.y) <= (cactusHeight + dinosaurHeight) / 2) {
            
            self.lose()
            
        }
        
    }
    
    // stop the game when collison is made
    func lose() {
        self.timer.upstream.connect().cancel()
        
        self.manager.lose(playerID: self.playerID)
    }
    
//    func restart() {
//
//        dinosaurPosition.x = self.initialDinosaurPosition["x"]
//        dinosaurPosition.y = self.initialDinosaurPosition["y"]
//
//        cactusPosition.x = self.initialCactusPosition["x"]
//        cactusPosition.y = self.initialCactusPosition["y"]
//
//        self.timer = self.timer.upstream.autoconnect()
//    }
    
    func test() {
        print("test function in IndividualGame")
    }
    
    
}
