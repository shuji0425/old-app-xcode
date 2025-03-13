//
//  ContentView.swift
//  goalAchievement
//
//  Created by 山本修司 on 2020/09/08.
//  Copyright © 2020 山本修司. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var number = 0
    @State var recover = 0
    
    var body: some View {
        HStack {
            Text("習慣")
                    
            Button(action: count) {
                Text("連続回数")
                    .foregroundColor(Color.white)
                    .padding(5)

            }.background(Color.blue)
            Text("\(number)")
            
            Text("復活")
            Text("\(recover)")
            
        }

        
    }
    func count() {
        self.number += 1
        if number == 2 {
            recover += 1
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
