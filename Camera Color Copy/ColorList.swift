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
                ColorRow()
                ColorRow()
                ColorRow()
                ColorRow()
                ColorRow()
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
