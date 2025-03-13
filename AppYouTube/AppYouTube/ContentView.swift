//
//  ContentView.swift
//  AppYouTube
//
//  Created by 山本修司 on 2020/09/14.
//  Copyright © 2020 山本修司. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var data: [String] = ["バナナ","パイナップル","オレンジ","メロン"]
    
    @State var selection: [String] = ["バナナ"]
    
    @State var btnOut:String = "ボタン"
    
    @State var inPut:String = ""
    
    var body: some View {
        VStack(spacing:50) {
            Text(verbatim: "選択項目: \(selection)")
            
            Divider()
            
            Button(action: {
                
                self.btnOut = "押された"
                
            }) {
                Text("\(btnOut)")
            }

            TextField("入力エリア", text: $inPut) {
                self.data.append(self.inPut)
            }
            
            Text("\(self.data.last!)が配列の最後の\(self.data.count)番目です。")
            
            SinglePicker(data: data, selection: $selection)
        }
    }
}

struct SinglePicker: View {
    let data: [String]
    @Binding var selection: [String]
    
    var body: some View {
        GeometryReader {geometry in
            Picker("果物", selection: self.$selection[0]) {
                ForEach(0..<self.data.count) {row in
                    Text(verbatim: self.data[row]).tag(self.data[row])
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
