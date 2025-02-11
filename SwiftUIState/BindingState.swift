//
//  BindingState.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/09.
//

import SwiftUI

struct BindingState: View {
  @Binding var title:String
  @Binding var titleInput: String
  let counter: Int
  
  init(title: Binding<String>, titleInput: Binding<String>) {
    _title = title
    _titleInput = titleInput
    
    let sentence = _title.wrappedValue
    counter = sentence.count
  }
  
    var body: some View {
      Text("\(title) (\(counter))")
        .padding()
      
      TextField("Input Title", text: $titleInput)
        .textFieldStyle(.roundedBorder)
    }
}

#Preview {
  BindingState(title: .constant("Hello, World!"), titleInput: .constant(""))
}

#Preview("Header", body: {
  let title = Binding<String> {
    "Hello, World!"
  } set: { _ in }
  
  let titleInput = Binding<String> {
    ""
  } set: { _ in }

  return BindingState(title: title, titleInput: titleInput)
})
