//
//  KeyEquivalentManager.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 31/05/2022.
//

import Foundation
import SwiftUI

struct KeyEquivalentManager {
    
    let key: KeyEquivalent
    
    public func getLabel() -> String {
        
        if (self.key.character == KeyEquivalent.tab.character) {
            return "Tab"
        }
        
        if (self.key.character == KeyEquivalent.upArrow.character) {
            return "Arrow Up"
        }
        
        return ""
        
    }
}
