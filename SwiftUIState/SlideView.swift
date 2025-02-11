//
//  SlideView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

struct SlideView: View {
  @State private var value = 0.0
  @State private var textActive = false
  
    var body: some View {
      Text("Current Value: \(value.formatted(.number.precision(.fractionLength(0))))")
      
      Slider(
        value: $value,
        in: 0...100,
        step: 1,
        onEditingChanged: { self.textActive = $0}
      )
        
      Text("Text Active: \(textActive ? "true" : "false")")
        
      Spacer()
        
    }
}

#Preview {
    SlideView()
    .padding()
}
