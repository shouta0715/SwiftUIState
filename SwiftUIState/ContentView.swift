//
//  ContentView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ScrollView {
        VStack(spacing: 16) {
          TextFieldView()
          SecureFieldView()
          TextEditorView()
          ToggleView()
          SlideView()
        }
        .padding()
      }
    }
}

#Preview {
    ContentView()
}
