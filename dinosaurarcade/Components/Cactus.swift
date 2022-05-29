//
//  Cactus.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct Cactus: View {
    
    // the image of cactus
    
    let width: CGFloat
    let height: CGFloat
        
    var body: some View {
        
        // show cactus from png asset
        Image("cactus-1")
            .resizable()
            .frame(width: width, height: height)
    }
}
