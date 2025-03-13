//
//  ContentView.swift
//  TapPlusData
//
//  Created by 山本修司 on 2020/09/13.
//  Copyright © 2020 山本修司. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var data:[String] = ["aaa"]
    @State var input:String = ""
    
    var body: some View {
        VStack {
            Text("LIST").font(.largeTitle)
            TextField("name", text:$input){
                self.data.append(self.input)
            }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            List {
                Text(input)
            }.font(.title)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
