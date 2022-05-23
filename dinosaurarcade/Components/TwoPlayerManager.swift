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
    public var winner = 1
    public var winnerDetermined = false
    public var restartState = [false, false]
    public var player1Score = 0
    public var player2Score = 0
        
    // public interface
    public mutating func lose(playerID: Int) {
        
        // log state of the corresponding playerID
        self.updateLoseState(playerID: playerID)
        
        // find winner
        self.findWinner()
                
    }
    
    public mutating func doRestart(forceNewGame: Bool = false) {
        
        func resetScore() {
            // reset score
            player1Score = 0
            player2Score = 0
        }
        
        func restartGame() {
            
            // restart game
            self.restart(playerID: 1)
            self.restart(playerID: 2)
            
        }
        
        func newGame() {
            resetScore()
            restartGame()
            self.winnerDetermined = false
        }
        
        
        if (forceNewGame || self.winnerDetermined) {
            
            newGame()

        } else {
            
            // new turn -- no reset score
            
            restartGame()

        }
        
    }

    
    public mutating func doneRestart() {

        self.restartState = [false, false]
        
    }
    
    private mutating func restart(playerID: Int) {

        self.restartState = [true, true]
        
    }
    
    private func updateLoseState(playerID: Int) {
        
        self.twoPlayerState.updateLoseState(playerID: playerID)
                
    }
    
    // helper
    private mutating func findWinner() {
        
        // default winner is 1
        self.winner = 1
        
        // update score String
        let player1LoseTime = self.twoPlayerState.player1State.timeLose
        let player2LoseTime = self.twoPlayerState.player2State.timeLose
        
        // if both the player loses --> Determine winner of the TURN
        if (player1LoseTime != 0 && player2LoseTime != 0) {
                        
            // update score
            if (player2LoseTime > player1LoseTime) {
                self.player2Score += 1
            } else {
                // if winner is player 1
                self.player1Score += 1
            }
            
            // reset state of both players
            self.twoPlayerState.player1State.timeLose = 0
            self.twoPlayerState.player2State.timeLose = 0
            
            print("Player 1 Score: \(self.player1Score)")
            print("Player 2 Score: \(self.player2Score)")
            
        }
        
        // find winner of the GAME
        if (player1Score + player2Score == 3 || player2Score == 2 && player1Score == 0 || player1Score == 2 && player2Score == 0) {
            
            self.winnerDetermined = true
            
            if (player2Score > player1Score) {
                winner = 2
            } else {
                winner = 1
            }
            
        }
    
        
    }
    
}
