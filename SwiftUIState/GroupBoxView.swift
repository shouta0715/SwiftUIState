//
//  GroupBoxView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

struct GroupBoxView: View {
  @State private var setting1 = false
  @State private var setting2 = false
  @State private var setting3 = false
  
    var body: some View {
      GroupBox("Setting") {
        VStack(spacing: 10) {
          Toggle("Setting 1", isOn: $setting1)
          Toggle("Setting 2", isOn: $setting2)
          Toggle("Setting 3", isOn: $setting3)
        }
      }
    }
}

#Preview {
    GroupBoxView()
    .padding()
}
