//
//  ContentView.swift
//  PlanApp
//
//  Created by 山本修司 on 2020/09/13.
//  Copyright © 2020 山本修司. All rights reserved.
//

import SwiftUI

// 遷移前の画面　一つ一つを横並びに表示させている
struct ItemView: View, Identifiable {
    var id = UUID()
    let msg:String
    let c:Color
    
    var body: some View {
        HStack {
            Text("")
                .font(.largeTitle)
                .frame(width:75, height:75)
                .foregroundColor(Color.white)
                .background(c)
            Text(msg)
                .font(.title)
                .padding(10)
                .foregroundColor(c)
        }
    }
}

// 遷移後の画面
struct DetailView: View {
    let item:ItemView
    
    var body: some View {
        VStack {
            Text(item.msg)
                .font(.largeTitle)
            Spacer(minLength: 0)
        }
        .frame(width:UIScreen.main.bounds.size.width)
        .background(item.c)
    }
}

// 遷移前の画面　縦に並べている
struct ContentView: View {
    @State var data = [
        ItemView(msg: "Red", c: Color.red),
        ItemView(msg: "Blue", c: Color.blue),
        ItemView(msg: "Green", c: Color.green),
        ItemView(msg: "Yellow", c: Color.yellow)
    ]
    @State var msg = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Selected: '\(self.msg)'.")
                    .font(.largeTitle)
            }
            
            NavigationView {
                List(data) {item in
                    NavigationLink(destination: DetailView(item:item)) {
                        item
                    }
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
