//
//  ContentView.swift
//  TextDataApp
//
//  Created by 山本修司 on 2020/09/15.
//  Copyright © 2020 山本修司. All rights reserved.
//

import SwiftUI

class TextFileService {
    let fname:String
    let path:URL
    
    init(filename:String) {
        self.fname = filename
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        path = dir!.appendingPathComponent(fname)
    }

    func getText() -> String {
        var result = "no data."
        do {
            result = try String(
                contentsOf: path,
                encoding: String.Encoding.utf8)
        } catch {
            result = "can't get data..."
        }
        return result
    }

    func setText(data:String) -> Void {
        try! data.write(
            to: path, atomically: false,
            encoding: String.Encoding.utf8)
    }
}

class TextFileModel: ObservableObject {
    @Published var data = String()
    let service: TextFileService
    
    init(filename:String) {
        service = TextFileService(filename: filename)
        self.load()
    }
    
    func load() {
        self.data = service.getText()
    }
    
    func save() {
        service.setText(data: self.data)
    }
}

struct ContentView: View {
    @State var msg = "Plan text."
    @ObservedObject var textmodel =
        TextFileModel(filename: "sample.txt")
    
    var body: some View {
        VStack {
        
            Text(msg)
                .font(.title)
            
            Divider()
            
            TextField("load data", text: $textmodel.data)
                .font(.body)
            .padding(10)
            
            Divider()
            
            Button("save data", action: {
                self.textmodel.save()
                self.msg = "saved..."
            })
                .font(.headline)
                .frame(width:300, height: 50)
                .border(Color.blue, width: 3.0)
            
            Divider()
            Spacer(minLength: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
