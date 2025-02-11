//
//  ModelView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

@Observable class ViewData {
  var titleInput: String = ""
  // @ObservationIgnored =>
  @ObservationIgnored var counter = 0
}

struct ModelView: View {
//  @Bindable var viewData = ViewData()
//  var app = ApplicationData.shared
  @Environment(ApplicationData.self) private var app
  
    var body: some View {
      @Bindable var app = app
      
      VStack {
        Text("Title: \(app.title)")
          .padding(10)
      
        TextField("Input Title", text: $app.titleInput)
          .textFieldStyle(.roundedBorder)
          .padding()
        
        Button {
          app.title = app.titleInput
        } label: {
          Text("Save")
        }
      
        Spacer()
      }
      .onAppear() {
        app.titleInput = app.title
      }
    }
}

#Preview {
    ModelView()
    .padding()
    .environment(ApplicationData.shared)
}
