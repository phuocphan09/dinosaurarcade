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
    @State var winnerDisplayText = "-"
    @State var restartButtonLabel = "Next turn"
    
    var body: some View {
        
        VStack {
            
            // score display
            HStack {
            
                Text("Player 1 Score: \(self.twoPlayerManager.player1Score)")
                    .font(.system(size: 30))
                    .padding(20)
                Text("Player 2 Score: \(self.twoPlayerManager.player2Score)")
                    .font(.system(size: 30))
                }
            
            // the winner text
            Text(self.winnerDisplayText)
                .font(.system(size: 30))
                .foregroundColor(Color.red)
            
            // CTA buttons
            HStack {
                
                Button("New game") {
                    twoPlayerManager.doRestart(forceNewGame: true)
                }
                
                Divider()
                
                Button(self.restartButtonLabel) {
                    twoPlayerManager.doRestart(forceNewGame: false)
                }
                

            }
    
        }
        
        // update winner and restart button text
        .onChange(of: twoPlayerManager.winnerDetermined) { winnerDetermined in
            if (winnerDetermined) {
                self.winnerDisplayText = "Player \(twoPlayerManager.winner) wins!"
                self.restartButtonLabel = "New game"
            } else {
                self.winnerDisplayText = "-"
                self.restartButtonLabel = "Next turn"
            }
        }

    }

}

