//
//  Cactus.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct Cactus: View {
    
    let width: CGFloat
    let height: CGFloat
    
    let cactusColor = Color.green
    
    var body: some View {
        
        // cactus from png
        Image("cactus-1")
            .resizable()
        
    
        // mock cactus
//        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(cactusColor)
        
            
    }
}
