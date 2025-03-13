//
//  ContentView.swift
//  TextApp
//
//  Created by 山本修司 on 2020/09/15.
//  Copyright © 2020 山本修司. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""

    var body: some View {
        VStack {
            // 入力
            MultilineTextField(text: $text)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 5)
                )
            // 表示
            Text(text)
                .foregroundColor(.yellow)
                .lineLimit(nil)
                .padding(5)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 200, alignment: .topLeading)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 5)
                )
        }
    }
}

// 複数行入力するためのTextField
struct MultilineTextField: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.delegate = context.coordinator
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.font = UIFont.systemFont(ofSize: 18)
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator : NSObject, UITextViewDelegate {

        var parent: MultilineTextField

        init(_ textView: MultilineTextField) {
            self.parent = textView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
