//
//  IndividualGame.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct IndividualGame: View {
    
    
    
    public var timer = Timer.publish(every: 0.1, on: RunLoop.main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
            Dinosaur(game: self)
            CactusManager(game: self)
            
                
        }
//        .onReceive(timer) {a in
//            self.move()
//        }
        

    }
    
    

    
    
    func collision() {
        
    }
    
}
