//
//  SecureFieldView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

struct SecureFieldView: View {
  @State private var password = ""
    var body: some View {
      VStack {
        SecureField("Input Password", text: $password)
          .textFieldStyle(.roundedBorder)
          .padding()
        
        Text("Password: \(password)")
        
        Spacer()
      }
      .padding()
    }
}

#Preview {
    SecureFieldView()
}
