//
//  ColorList.swift
//  Camera Color Copy
//
//  Created by Teruhiko Tanaka on 2020/09/04.
//  Copyright © 2020 Teruhiko Tanaka. All rights reserved.
//

import SwiftUI

struct ColorList: View {
    var body: some View {
        NavigationView {
            List {
                ColorRow(hexColor: "#222222")
                ColorRow(hexColor: "#333333")
                ColorRow(hexColor: "#444444")
                ColorRow(hexColor: "#555555")
                ColorRow(hexColor: "#666666")
            }
            .navigationBarTitle(Text("History Color"))
        }
    }
}

struct ColorList_Previews: PreviewProvider {
    static var previews: some View {
        ColorList()
    }
}
