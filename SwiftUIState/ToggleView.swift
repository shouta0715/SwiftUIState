//
//  ToggleView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

struct MyStyle:ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    let imageName = configuration.isOn ? "checkmark.rectangle.fill" : "xmark.rectangle.fill"
    
    HStack(alignment: .center) {
      configuration.label
      Spacer()
      Image(systemName: imageName)
        .font(.largeTitle)
        .foregroundStyle(configuration.isOn ? .green : .gray)
        .onTapGesture {
          withAnimation(.easeInOut(duration: 0.15)) {
            configuration.$isOn.wrappedValue.toggle()
          }
        }
    }
  }
}

struct ToggleView: View {
  @State private var isOn = false
  @State private var isOn2 = false
  @State private var isOn3 = false
  @State private var isOn4 = false
  
    var body: some View {
      VStack {
        Toggle(isOn: $isOn) {
          Text(isOn ? "ON" : "OFF")
          Text("Enable or Disable")
        }
        
        
        HStack {
          Toggle("", isOn: $isOn2)
            .labelsHidden()
          Text(isOn2 ? "ON" : "OFF")
            .padding()
            .background(isOn2 ? Color.green : Color.red)
        }
        
        Toggle(isOn: $isOn3) {
          Label("Toggle", systemImage: "power")
        }
        .toggleStyle(.button)
        
        Toggle(isOn: $isOn4) {
          Text("Toggle")
        }
        .toggleStyle(MyStyle())
          
        
        
        Spacer()
      }
    
    }
}

#Preview {
    ToggleView()
    .padding()
}
