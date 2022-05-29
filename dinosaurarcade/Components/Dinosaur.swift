//
//  Dinosaur.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct Dinosaur: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        
        // show dinosaur from png asset
        Image("dinosaur-runner-2")
            .resizable()
            .frame(width: self.width, height: self.height)
        
    }
    
}
