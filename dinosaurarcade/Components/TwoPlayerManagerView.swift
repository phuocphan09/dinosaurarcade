//
//  TwoPlayerManagerView.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 15/05/2022.
//

import Foundation
import SwiftUI

struct TwoPlayerManagerView: View {
    
    @Binding var twoPlayerManager: TwoPlayerManager
    
    var body: some View {
        
        HStack {
        
            Text("Player 1 Score: \(self.twoPlayerManager.player1Score)")
                .font(.system(size: 30))
                .padding(20)
            Text("Player 2 Score: \(self.twoPlayerManager.player2Score)")
                .font(.system(size: 30))
            
        }
        
    }
}
