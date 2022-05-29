//
//  TwoPlayerState.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 16/05/2022.
//

import Foundation

struct TwoPlayerState {
    
    // This class helps TwoPlayerManager keep track of and manipulate the losing state of both players
    
    public var player1State = PlayerState(playerID: 1)
    public var player2State = PlayerState(playerID: 2)
    
    // the state of a player is determined by the losing timestamp (accurate to milisecond) of that player
    mutating func updateLoseState(playerID: Int) {
        
        if (playerID == 1) {
            self.player1State.updateTimeLose()
        }
        
        if (playerID == 2) {
            self.player2State.updateTimeLose()
        }
    }
    
    mutating func removeLoseState(playerID: Int) {
        
        if (playerID == 1) {
            self.player1State.removeTimeLose()
        }
        
        if (playerID == 2) {
            self.player2State.removeTimeLose()
        }
        
    }
    
}
