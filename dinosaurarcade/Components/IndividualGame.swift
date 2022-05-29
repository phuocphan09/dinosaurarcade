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
    
    // PlayerID
    let playerID: Int
    
    // Input key to jump control
    let jumpKey: KeyEquivalent
    
    // Refresh rate for this game
    @State var timer = Timer.publish(every: 0.08, on: RunLoop.main, in: .common).autoconnect()
    
    // Bind with the Manager of this Individual
    @Binding var manager: TwoPlayerManager
    
    // Configuration
    // Difficulty configuration
    let easierCollision = 0.75 // always less than 1, the lower the easier (accept to collide 1 - easierCollision into the cactus)
    
    // Size configuration for components
    var dinosaurWidth: CGFloat = 70
    var dinosaurHeight: CGFloat = 70
    @State var cactusWidth: CGFloat = 40
    
    // The game needs to know the position of its component real-time, hence using binding state
    let initialCactusPosition = ["x": 450, "y": 250]
    let initialDinosaurPosition = ["x": 120, "y": 250]
    @State private var cactusPosition = CGPoint(x: 450, y: 250)
    @State private var dinosaurPosition = CGPoint(x: 120, y: 250)
    @State var cactusSpeed = 1.0 // initial state of the cactus speed
    @State var score = 0
    
    var body: some View {
        
        VStack {
            
            // Text labels
            HStack {
                
                // PlayerID label
                Text("Player \(self.playerID)")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                
                // Individual game's score
                Text("Score: \(self.score)")
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
            }
            

            
            // Main components of a game
            VStack {
                
                // render the UI, two components only
                ZStack {
                    
                    // Cactus and the animation
                    CactusManager(cactusPosition: self.$cactusPosition, speed: self.$cactusSpeed, width: self.$cactusWidth, game: self)
                    
                    // Dinosaur
                    DinosaurManager(dinosaurPosition: self.$dinosaurPosition, width: self.dinosaurWidth, height: self.dinosaurHeight, timer: self.timer, jumpKey: jumpKey)
                    
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
                        manager.doneRestart() // (Observer Pattern) 
                    }
                    
                }
                
                // Background image
                Image("dinosaur-bg-1")
                    .position(x: 0, y: 30)
            }
            
        }
        
    }
    
    
    func collisionCheck() {
        
        // Check for collision
        
        if (abs(cactusPosition.x - dinosaurPosition.x) <= (cactusWidth + dinosaurWidth) / 2 * easierCollision) && (abs(cactusPosition.y - dinosaurPosition.y) <= (2 * cactusWidth + dinosaurHeight) / 2 * easierCollision) {
            
            // if collision happens --> lose game
            self.lose()
            
        } else {
            
            // if collision NOT happen --> increment score
            self.incrementScore()
        
        }
        
    }
    
    // stop the game when collison happens
    public func lose() {
        
        // disable the refresh rate
        self.timer.upstream.connect().cancel()
        
        // notify the manager (Observer Pattern)
        self.manager.lose(playerID: self.playerID)
        
    }
    
    // restart the game -- either for a new turn in a game or a new game
    public func restart() {
        
        // reset score
        self.score = 0
        
        // reset moving speed of cactus
        self.cactusSpeed = 1.0
        
        // reset losing state
        self.manager.twoPlayerState.removeLoseState(playerID: 1)
        self.manager.twoPlayerState.removeLoseState(playerID: 2)

        // place components to its original places
        dinosaurPosition.x = CGFloat(self.initialDinosaurPosition["x"]!)
        dinosaurPosition.y = CGFloat(self.initialDinosaurPosition["y"]!)

        cactusPosition.x = CGFloat(self.initialCactusPosition["x"]!)
        cactusPosition.y = CGFloat(self.initialCactusPosition["y"]!)

        // restart the timer
        self.timer = Timer.publish(every: 0.08, on: RunLoop.main, in: .common).autoconnect()
        
    }
    
    private func incrementScore() {
        
        self.score += 1
        
    }
    
    
}
