//
//  ColorMeter.swift
//  Camera Color Copy
//
//  Created by Teruhiko Tanaka on 2020/09/19.
//  Copyright © 2020 Teruhiko Tanaka. All rights reserved.
//

import SwiftUI

struct ColorMeter: View {
    var hexColor: String
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color(hexColor.color))
                .frame(width:30, height: 30)
            Text(hexColor)
                .foregroundColor(.black)
        }
        .frame(width: 115, height: 45)
        .background(Color.white)
    }
}

struct RgbCounter_Previews: PreviewProvider {
    static var previews: some View {
        ColorMeter(hexColor: "#000000")
    }
}
