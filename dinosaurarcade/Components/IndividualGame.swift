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
    
    var dinosaurSize = ["width": CGFloat(30),
                        "height": CGFloat(30)]
    
    var dinosaurWidth: CGFloat = 30
    var dinosaurHeight: CGFloat = 30
    var cactusWidth: CGFloat = 10
    var cactusHeight: CGFloat = 120
    
//    var cactusSize = ["width": CGFloat(10),
//                      "height": CGFloat(120)]
    
    @State private var cactusPosition = CGPoint(x: 500, y: 400)
    @State private var dinosaurPosition = CGPoint(x: 200, y: 400)
    
    var body: some View {
        
        ZStack {
            
            Dinosaur(dinosaurPosition: self.$dinosaurPosition, width: self.dinosaurWidth, height: self.dinosaurHeight, game: self)
            CactusManager(cactusPosition: self.$cactusPosition, width: self.cactusWidth, height: self.cactusHeight, game: self)
                
        }
        .onReceive(timer) {a in
            self.collisionCheck()
        }
        
    }
    
    
    func collisionCheck() {
        print(self.dinosaurPosition)
        print(self.cactusPosition)
        
        if (abs(cactusPosition.x - dinosaurPosition.x) <= (cactusWidth + dinosaurWidth) / 2) && (abs(cactusPosition.y - dinosaurPosition.y) <= (cactusHeight + dinosaurHeight) / 2) {
            
            self.stop()
            
        }
        
    }
    
    func stop() {
        self.timer.upstream.connect().cancel()
    }
    
    
}
