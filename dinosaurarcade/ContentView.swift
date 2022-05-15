//
//  ContentView.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    public var timer = Timer.publish(every: 0.08, on: RunLoop.main, in: .common).autoconnect()
    @State var twoPlayerManager = TwoPlayerManager()
    
    
    var body: some View {
        
        VStack {
            
            // Manager
            TwoPlayerManagerView(twoPlayerManager: self.$twoPlayerManager)
                .padding(20)
            
            HStack {
                
                // Left side player
                IndividualGame(playerID: 1, jumpKey: KeyEquivalent.tab, manager: self.$twoPlayerManager)
                    .frame(minWidth: 400, maxWidth: 800, minHeight: 800, maxHeight: 800)
                
                // A divider between two players
                Divider()
                    
                // Right side player
                IndividualGame(playerID: 2, jumpKey: KeyEquivalent.upArrow, manager: self.$twoPlayerManager)
                    .frame(minWidth: 400, maxWidth: 800, minHeight: 800, maxHeight: 800)
            
            }
            
        }
        
        

    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
