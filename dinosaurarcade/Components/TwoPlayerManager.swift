//
//  TwoPlayerManager.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 15/05/2022.
//

import Foundation
import SwiftUI

struct TwoPlayerManager {
    
//    @State var playerState1 = PlayerState(playerID: 1)
//    @State var playerState2 = PlayerState(playerID: 2)
    
    @State var twoPlayerState = TwoPlayerState()
    public var player1Score = 0
    public var player2Score = 0
        
    // public interface
    public mutating func lose(playerID: Int) {
        
        // log state of the corresponding playerID
        self.updateLoseState(playerID: playerID)
        
        // find winner
        self.findWinner()
        
    }
    
    private func updateLoseState(playerID: Int) {
        
        self.twoPlayerState.updateLoseState(playerID: playerID)
                
    }
    
    // helper
    private mutating func findWinner() {
        
        // default winner is 1
        var winner = 1
        
        // update score String
        let player1LoseTime = self.twoPlayerState.player1State.timeLose
        let player2LoseTime = self.twoPlayerState.player2State.timeLose
        
        // if both the player loses --> Determine winner
        if (player1LoseTime != 0 && player2LoseTime != 0) {
            
            print("hello")
            
            // update score
            if (player2LoseTime > player1LoseTime) {
                // if winner is player 2
                winner = 2
                self.player2Score += 1
            } else {
                // if winner is player 1
                self.player1Score += 1
            }
            
//            // reset state of both players
//            self.twoPlayerState.player1State.timeLose = 0
//            self.twoPlayerState.player2State.timeLose = 0
            
            print("Player 1 Score: \(self.player1Score)")
            print("Player 2 Score: \(self.player2Score)")
            
        }
    
        
        // reset state
        
        
    }
    
}
