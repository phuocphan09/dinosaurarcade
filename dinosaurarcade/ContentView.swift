//
//  ContentView.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .padding()
        
        IndividualGame()
        .frame(minWidth: 1400, minHeight: 800)
            
    }
//    .frame(minWidth: windowSize().minWidth, minHeight: windowSize().minHeight)
//    .frame(maxWidth: windowSize().maxWidth, maxHeight: windowSize().maxHeight)
//    .border(Color.blue, width: 1)
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
