//
//  ApplicationData.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import Observation
import SwiftUI

@Observable class ApplicationData: @unchecked Sendable {
  var title: String = "Default Title"
  var titleInput: String  = ""
  
  static let shared = ApplicationData()
  
  private init() {}
}

