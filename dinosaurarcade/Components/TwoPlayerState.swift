//
//  TwoPlayerState.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 16/05/2022.
//

import Foundation

struct TwoPlayerState {
    
    public var player1State = PlayerState(playerID: 1)
    public var player2State = PlayerState(playerID: 2)
    
    mutating func updateLoseState(playerID: Int) {
        if (playerID == 1) {
            self.player1State.updateTimeLose()
        }
        
        if (playerID == 2) {
            self.player2State.updateTimeLose()
        }
    }
}
