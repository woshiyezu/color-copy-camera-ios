//
//  ContentView.swift
//  Camera Color Copy
//
//  Created by Teruhiko Tanaka on 2020/08/31.
//  Copyright © 2020 Teruhiko Tanaka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject private var avFoundationViewModel = AVFoundationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if avFoundationViewModel.image == nil {

                    ZStack(alignment: .center) {
                        CALayerView(caLayer: avFoundationViewModel.previewLayer)

                        Circle()
                            .stroke(Color.blue, lineWidth: 3)
                            .frame(width: 16, height: 16)
                    }.onAppear {
                        self.avFoundationViewModel.startSession()
                    }.onDisappear {
                        self.avFoundationViewModel.endSession()
                    }
                }
                Button("add"){
                    let hexColor = HexColor(context: self.moc)
                    hexColor.id = UUID()
                    hexColor.code = "#556677"
                    try? self.moc.save()
                }
            
                NavigationLink("Go ColorList", destination: ColorList())
                    .navigationBarTitle(Text("Camera Color Copy"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
