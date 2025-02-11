//
//  ProgressView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

struct ProgressbarView: View {
  @State private var currentValue: Float = 5
  
    var body: some View {
      VStack(spacing: 10) {
        ProgressView()
          .progressViewStyle(.circular)
        
        ProgressView(value: currentValue, total: 10)
        
        Button {
          withAnimation {
            currentValue += 1
          }
        } label: {
          Text("Increment")
        }
        .padding()
        
        
        Button {
          withAnimation {
            currentValue -= 1
          }
        } label: {
          Text("Decrement")
        }
        .padding()
        
        Spacer()
      }
    }
}

#Preview {
  ProgressbarView()
    .padding()
}
