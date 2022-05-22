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
    @State var winnerDisplayText = ""
    @State var restartButtonLabel = "Next turn"
    
    var body: some View {
        
        VStack {
            
            HStack {
            
                Text("Player 1 Score: \(self.twoPlayerManager.player1Score)")
                    .font(.system(size: 30))
                    .padding(20)
                Text("Player 2 Score: \(self.twoPlayerManager.player2Score)")
                    .font(.system(size: 30))

                }
            
            // winner text
            Text(self.winnerDisplayText)
                .font(.system(size: 30))
            
            Button(self.restartButtonLabel) {
                twoPlayerManager.doRestart()
            
            }
    
        }
        
        // update winner text
        .onChange(of: twoPlayerManager.winnerDetermined) { winnerDetermined in
            if (winnerDetermined) {
                self.winnerDisplayText = "Player \(twoPlayerManager.winner) wins!"
                self.restartButtonLabel = "New game"
            } else {
                self.winnerDisplayText = ""
                self.restartButtonLabel = "Next turn"
            }
        }

    }

}

