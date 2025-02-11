//
//  StateHook.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/09.
//

import SwiftUI

struct StateHook: View {
  @State private var isValid = false
  @State private var title = "Hello, World!"
  @State private var titleInput = ""
  
  
    var body: some View {
      VStack {
        Text("isValid: \(isValid ? "true" : "false")")
          .padding()
                
        BindingState(title: $title, titleInput: $titleInput)
        Button {
          title = titleInput
          titleInput = ""
        } label: {
          Text("Change Title")
        }

        Button {
          isValid.toggle()
        } label: {
          Text("Toggle isValid")
        }
        .padding(.top)
        Spacer()
      }
      .padding()
    }
}

#Preview {
    StateHook()
}
