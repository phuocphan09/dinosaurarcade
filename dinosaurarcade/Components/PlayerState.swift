//
//  PlayerState.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 15/05/2022.
//

import Foundation
import SwiftUI

class PlayerState {
    
    // This class represent the data structure of the losing state of an individual player
    // The losing state is defined as the timestamp collision between the dinosaur of that game with cactus happens
    
    var playerID: Int
    var timeLose: Int
    
    init(playerID: Int) {
        timeLose = 0
        self.playerID = playerID
    }
    
    public func updateTimeLose() {
        self.timeLose = Int(Date().timeIntervalSince1970 * 1000)
    }
    
    public func removeTimeLose() {
        self.timeLose = 0
    }
    
    public func getTimeLose() -> Int {
        return self.timeLose
    }
    
}
