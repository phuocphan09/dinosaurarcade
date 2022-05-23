//
//  ContentView.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var twoPlayerManager = TwoPlayerManager()
    
    var body: some View {
        
        VStack {
            
            // Manager
            TwoPlayerManagerView(twoPlayerManager: self.$twoPlayerManager)
                .padding(20)
            
            HStack {
                
                // Left side player
                IndividualGame(playerID: 1, jumpKey: KeyEquivalent.tab, manager: self.$twoPlayerManager)
                    .frame(minWidth: 500, maxWidth: 500, minHeight: 500, maxHeight: 500)
                    .padding(20)
                
                // A divider between two players
                Divider()
                    .frame(width: 2)
                    .background(Color.gray)
                    
                // Right side player
                IndividualGame(playerID: 2, jumpKey: KeyEquivalent.upArrow, manager: self.$twoPlayerManager)
                    .frame(minWidth: 500, maxWidth: 500, minHeight: 500, maxHeight: 500)
                    .padding(20)
            
            }
            
        }

    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//            ContentView()
        }
    }
    
}
