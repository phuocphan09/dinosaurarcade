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

    @State var timer = Timer.publish(every: 0.08, on: RunLoop.main, in: .common).autoconnect()
    @Binding var manager: TwoPlayerManager
    
    
    let dinosaurSize = ["width": CGFloat(30),
                        "height": CGFloat(30)]
    let easierCollision = 0.9 // always less than 1, the lower the easier (accept to collide 1 - easierCollision into the cactus)
    
    // Size configuration for components
    var dinosaurWidth: CGFloat = 70
    var dinosaurHeight: CGFloat = 70
    var cactusWidth: CGFloat = 40
    var cactusHeight: CGFloat = 80 // 1:2 ratio
    
    // The game needs to know the position of its component real-time, hence using binding state
    let initialCactusPosition = ["x": 420, "y": 250]
    let initialDinosaurPosition = ["x": 120, "y": 250]
    @State private var cactusPosition = CGPoint(x: 420, y: 250)
    @State private var dinosaurPosition = CGPoint(x: 120, y: 250)
    
    // Keep track of individual score
    @State var score = 0
    
    var body: some View {
        
        VStack {
            
            // Individual game's score
            Text("Score: \(self.score)")
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .topTrailing)
            
            // Main components of a game
            VStack {
                
                // render the UI, two components only
                ZStack {
                    
                    CactusManager(cactusPosition: self.$cactusPosition, width: self.cactusWidth, height: self.cactusHeight, game: self)
                    
                    Dinosaur(dinosaurPosition: self.$dinosaurPosition, width: self.dinosaurWidth, height: self.dinosaurHeight, game: self, jumpKey: jumpKey)
                    
                }
                
                // check for collision
                .onReceive(timer) {a in
                    self.collisionCheck()
                }
                
                // listen for restart signal
                .onChange(of: manager.restartState) { restartState in
                    
                    print("player \(self.playerID) : \(restartState)")
                    
                    if (restartState[self.playerID - 1]) {
                        self.restart()
                        manager.doneRestart()
                    }
                    
                }
                
                // background
                Image("dinosaur-bg-1")
                    .position(x: 0, y: 30)
            }
            
            
        }
        
        
    
        
    }
    
    
    func collisionCheck() {
        
        // Check for collision
        
        if (abs(cactusPosition.x - dinosaurPosition.x) <= (cactusWidth + dinosaurWidth) / 2 * easierCollision) && (abs(cactusPosition.y - dinosaurPosition.y) <= (cactusHeight + dinosaurHeight) / 2 * easierCollision) {
            
            // if collision happens --> lose game
            self.lose()
            
        } else {
            
            // if collision NOT happen --> increment score
            self.incrementScore()
        
        }
        
    }
    
    // stop the game when collison is made
    func lose() {
        self.timer.upstream.connect().cancel()
        self.manager.lose(playerID: self.playerID)
    }
    
    // restart the game -- either for a new turn in a game or a new game
    func restart() {
        
        // reset score
        self.score = 0

        // place objects to its places
        dinosaurPosition.x = CGFloat(self.initialDinosaurPosition["x"]!)
        dinosaurPosition.y = CGFloat(self.initialDinosaurPosition["y"]!)

        cactusPosition.x = CGFloat(self.initialCactusPosition["x"]!)
        cactusPosition.y = CGFloat(self.initialCactusPosition["y"]!)

        // restart the timer
        self.timer = Timer.publish(every: 0.08, on: RunLoop.main, in: .common).autoconnect()
        
    }
    
    func incrementScore() {
        self.score += 1
    }
    
    func test() {
        print("test function in IndividualGame")
    }
    
    
}
