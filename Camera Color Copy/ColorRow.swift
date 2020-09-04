//
//  ColorRow.swift
//  Camera Color Copy
//
//  Created by Teruhiko Tanaka on 2020/09/04.
//  Copyright © 2020 Teruhiko Tanaka. All rights reserved.
//

import SwiftUI

struct ColorRow: View {
    var hexColor: String
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color(hexColor.color))
                .frame(width:100, height: 70)
            Text(hexColor)
            Spacer()
        }
    }
}

struct ColorRow_Previews: PreviewProvider {
    static var previews: some View {
        ColorRow(hexColor: "#222222")
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
