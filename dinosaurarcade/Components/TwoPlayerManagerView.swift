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
    @State var winnerDisplayText = "Competition is in progress..."
    @State var restartButtonLabel = "Next turn"
    
    var body: some View {
        
        VStack {
            
            // score display
            HStack {
                
                Text("Player1")
                Spacer()
                
                HStack {
                    Text("\(self.twoPlayerManager.player1Score)")
                    Text("   -   ")
                    Text("\(self.twoPlayerManager.player2Score)")
                }
                .font(.system(size: 80))
                
                Spacer()
                Text("Player2")
                
            }
            .font(.system(size: 30))
            .foregroundColor(Color.blue)
            
            // the winner text
            Text(self.winnerDisplayText)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(Color.blue)
            

            
            // CTA buttons
            HStack {
                
                // show manual new game button if only winner is not determined
                if (!twoPlayerManager.gameWinnerDetermined) {
                    
                    Button("New game") {
                        twoPlayerManager.doRestart(forceNewGame: true)
                    }
                    .buttonStyle(GlowingButton(isMainCTA: false))
                    
                }
                
            
                Button(self.restartButtonLabel) {
                    twoPlayerManager.doRestart(forceNewGame: false)
                }
                .buttonStyle(GlowingButton(isMainCTA: true))

            }
    
        }
        
        // update winner and restart button text
        .onChange(of: twoPlayerManager.turnWinnerDetermined) { turnWinnerDetermined in
            
            if (turnWinnerDetermined) {
                
                if (twoPlayerManager.gameWinnerDetermined) {
                    
                    // winner of GAME determined
                    self.winnerDisplayText = "Player \(twoPlayerManager.gameWinner) won this game! New game?"
                    self.restartButtonLabel = "New game"
                } else {
                    
                    // winner of TURN determined
                    self.winnerDisplayText = "Player \(twoPlayerManager.turnWinner) won this turn! Next turn?"
                    self.restartButtonLabel = "Next turn"
                }
                
            } else {
                
                
                self.winnerDisplayText = "Competition is in progress..."
                self.restartButtonLabel = "Next turn"
                
            }
        }

    }

}

