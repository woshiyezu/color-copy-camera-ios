//
//  ColorList.swift
//  Camera Color Copy
//
//  Created by Teruhiko Tanaka on 2020/09/04.
//  Copyright © 2020 Teruhiko Tanaka. All rights reserved.
//

import SwiftUI

struct ColorList: View {
    @State private var hexColors = ["#222222", "#333333", "#444444"]
    @State private var showingAlert = false
    
    var body: some View {
        List {
            ForEach(hexColors, id: \.self) { hexColor in
                ColorRow(hexColor: hexColor)
                    .onTapGesture {
                        self.showingAlert = true
                        UIPasteboard.general.string = hexColor
                }
            }
            .onDelete(perform: rowRemove)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("\(UIPasteboard.general.string!) copied!!"))
        }
        .navigationBarTitle(Text("History Color"))
    }
    
    func rowRemove(offsets: IndexSet) {
        hexColors.remove(atOffsets: offsets)
    }
}

struct ColorList_Previews: PreviewProvider {
    static var previews: some View {
        ColorList()
    }
}
