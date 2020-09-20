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
        GeometryReader { bodyView in
            NavigationView {
                VStack {
                    ZStack(alignment: .center) {
                        CALayerView(caLayer: avFoundationViewModel.previewLayer)
                        ColorMeter(hexColor: avFoundationViewModel.colorCode ?? "#ffffff")
                            .padding(.top, -60)
                        Circle()
                            .stroke(Color.blue, lineWidth: 3)
                            .frame(width: 16, height: 16)
                    }.onAppear {
                        self.avFoundationViewModel.startSession()
                    }.onDisappear {
                        self.avFoundationViewModel.endSession()
                    }
                    HStack(spacing: 0) {
                        Spacer()
                            .frame(width: bodyView.size.width / 3)
                        Button("COPY"){
                            let colorCode = avFoundationViewModel.colorCode ?? "#ffffff"
                            
                            let hexColor = HexColor(context: self.moc)
                            hexColor.id = UUID()
                            hexColor.code = colorCode
                            try? self.moc.save()
                            
                            UIPasteboard.general.string = colorCode
                        }
                            .accentColor(Color.white)
                            .frame(width: bodyView.size.width / 3, height: 40.0, alignment: .center)
                            .background(Color.blue)
                    
                        NavigationLink(destination: ColorList()) {
                            Image("History")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 26.0, height: 26.0)
                        }
                            .frame(width: bodyView.size.width / 3)
                    }
                        .frame(height: 50)
                }
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
