//
//  StepperView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

struct StepperView: View {
  @State private var step = 0
  @State private var step2 = 0
  
    var body: some View {
      VStack(spacing: 10) {
        Text("Step: \(step.formatted(.number.precision(.fractionLength(0))))")
        
        Stepper("Counter", value: $step, in: 0...10, step: 5)
        
        HStack {
          Text("Step2: \(step2.formatted(.number.precision(.fractionLength(0))))")
          Image(systemName: "plus.circle")
          Stepper("") {
            print("Increment")
            step2 += 1
          } onDecrement: {
            print("Decrement")
            step2 -= 1
          }
          .labelsHidden()
        }


          
        Spacer()
      }
    }
}

#Preview {
    StepperView()
    .padding()
}
