//
//  ColorList.swift
//  Camera Color Copy
//
//  Created by Teruhiko Tanaka on 2020/09/04.
//  Copyright © 2020 Teruhiko Tanaka. All rights reserved.
//

import SwiftUI

struct ColorList: View {
    @State private var showingAlert = false
    
    var body: some View {
        List {
            ColorRow(hexColor: "#222222")
                .onTapGesture {
                    self.showingAlert = true
                    UIPasteboard.general.string = "#222222"
            }
            
            ColorRow(hexColor: "#333333")
                .onTapGesture {
                    self.showingAlert = true
                    UIPasteboard.general.string = "#333333"
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("\(UIPasteboard.general.string!) copied!!"))
        }
        .navigationBarTitle(Text("History Color"))
    }
}

struct ColorList_Previews: PreviewProvider {
    static var previews: some View {
        ColorList()
    }
}
