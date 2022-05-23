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
            
                Text("Player1")
                Spacer()
                
                HStack {
                    Text("\(self.twoPlayerManager.player1Score)")
                    Text("   -   ")
                    Text("\(self.twoPlayerManager.player2Score)")
                }
                .font(.system(size: 70))
                
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
                
                Button("New game") {
                    twoPlayerManager.doRestart(forceNewGame: true)
                }
                .buttonStyle(GlowingButton())
                
                
                // show new turn button if only winner is not determined
                if (!twoPlayerManager.winnerDetermined) {
                    
                    Button(self.restartButtonLabel) {
                        twoPlayerManager.doRestart(forceNewGame: false)
                    }
                    .buttonStyle(GlowingButton())
                    
                }

                
            }
    
        }
        
        // update winner and restart button text
        .onChange(of: twoPlayerManager.winnerDetermined) { winnerDetermined in
            if (winnerDetermined) {
                self.winnerDisplayText = "Player \(twoPlayerManager.winner) wins this game! New game?"
            } else {
                self.winnerDisplayText = "-"
            }
        }

    }

}

