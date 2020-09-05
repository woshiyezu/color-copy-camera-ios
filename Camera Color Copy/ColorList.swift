import SwiftUI

struct ColorList: View {
    @State private var showingAlert = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: HexColor.entity(), sortDescriptors: []) var hexColors:
    FetchedResults<HexColor>
    
    var body: some View {
        List {
            ForEach(hexColors, id: \.self) { hexColor in
                ColorRow(hexColor: hexColor.code!)
                    .onTapGesture {
                        self.showingAlert = true
                        UIPasteboard.general.string = hexColor.code
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
        for index in offsets {
            let hexColor = hexColors[index]
            self.moc.delete(hexColor)
        }
        try? self.moc.save()
    }
}

struct ColorList_Previews: PreviewProvider {
    static var previews: some View {
        ColorList()
    }
}
