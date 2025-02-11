//
//  TextEditorView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

struct TextEditorView: View {
  @State private var text = ""
    var body: some View {
      VStack {
        TextEditor(text: $text)
          .textFieldStyle(.roundedBorder)
          .padding()
          .multilineTextAlignment(.leading)
          .border(Color.gray)
          .autocorrectionDisabled(true)
          
        Text("Text: \(text)")
       
        Spacer()
      }
      .padding()
    }
}

#Preview {
    TextEditorView()
}
