//
//  Cactus.swift
//  dinosaurarcade
//
//  Created by LAP13335 on 08/05/2022.
//

import Foundation
import SwiftUI

struct Cactus: View {
    
    let width: CGFloat = 10
    let height: CGFloat = 120
    let cactusColor = Color.green
    
    var body: some View {
            Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(cactusColor)
    }
}
