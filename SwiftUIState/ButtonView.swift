//
//  ButtonView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

struct MyButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    let isPressed = configuration.isPressed
    
    return configuration.label
      .padding()
      .foregroundColor(.white)
      .background(isPressed ? Color.blue : Color.red)
      .clipShape(RoundedRectangle(cornerRadius: 20))
      .scaleEffect(isPressed ? 1.2 : 1.0)
  }
  
}

struct ButtonView: View {
  @State private var colorisActive = false
  @State private var showInfo = false
  @State private var expanded = false

  
    var body: some View {
      VStack(spacing: 10) {
        Text("Default Title")
          .padding()
          .background(colorisActive ? Color.red : Color.blue)
        
        Text("Title")
          .frame(minWidth: 0, maxWidth: expanded ? .infinity : 150, maxHeight: 50)
          .background(.yellow)
        
        Button("Change Color") {
          colorisActive.toggle()
        }
        
        Button {
          showInfo.toggle()
        } label: {
          if(showInfo) {
            Text("Hide Info")
          } else {
            Text("Show Info")
          }
        }
        .disabled(!colorisActive)
        
        Button {
          withAnimation {
            expanded.toggle()
          }
        } label: {
          HStack {
            Image(systemName: expanded ? "arrow.down" : "arrow.up")
              .resizable()
              .frame(width: 20, height: 20)
              
            Text(expanded ? "Close" : "Open")
          }
        }
        
        VStack {
          Button("Cancel", role: .cancel) {
            print("Cancel")
          }
          .buttonStyle(.bordered)
          
          Button("Send") {
            print("Send")
          }
          .buttonStyle(.borderedProminent)
          .controlSize(.large)
        }
        
        VStack {
          Button {
            print("Default Button")
          } label: {
            Text("Custom Button")
          }
          .buttonStyle(MyButton())
        }
        
        Spacer()
      }
      .padding()
      
    }
}

#Preview {
    ButtonView()
}
