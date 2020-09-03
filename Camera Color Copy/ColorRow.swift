//
//  ColorRow.swift
//  Camera Color Copy
//
//  Created by Teruhiko Tanaka on 2020/09/04.
//  Copyright © 2020 Teruhiko Tanaka. All rights reserved.
//

import SwiftUI

struct ColorRow: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.red)
                .frame(width:100, height: 70)
            Text("#111111")
            Spacer()
        }
    }
}

struct ColorRow_Previews: PreviewProvider {
    static var previews: some View {
        ColorRow()
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
