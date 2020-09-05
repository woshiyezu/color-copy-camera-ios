//
//  ContentView.swift
//  Camera Color Copy
//
//  Created by Teruhiko Tanaka on 2020/08/31.
//  Copyright © 2020 Teruhiko Tanaka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink("Go ColorList.", destination: ColorList())
                .navigationBarTitle(Text("Camera Color Copy"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
