//
//  PlayerState.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 15/05/2022.
//

import Foundation
import SwiftUI

class PlayerState {
    
    var playerID: Int
    var isPaused: Bool
    var timeLose: Int
    
    init(playerID: Int) {
        isPaused = false
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
