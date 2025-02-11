//
//  SwiftUIStateApp.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/09.
//

import SwiftUI

@main
struct SwiftUIStateApp: App {
  @State private var app = ApplicationData.shared
  
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(app)
        }
    }
}
