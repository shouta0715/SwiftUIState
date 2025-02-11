//
//  TextFieldView.swift
//  SwiftUIState
//
//  Created by k21047kk on 2025/02/11.
//

import SwiftUI

enum FocusName {
  case name
  case surname
}
  

struct TextFieldView: View {
  @FocusState var focusName: FocusName?
  
  @State private var title  = "Default Title"
  @State private var titleInput = ""
  
  @State private var name = "Defalut Name"
  @State private var nameInput = ""
  @State private var surname = ""
  
  @State private var age = 0
  @State private var ageInput = ""
  
  @State private var textareaInput = ""
  @State private var selected: TextSelection? = nil
  
  
  func assignTitle() {
    title = titleInput
    titleInput = ""
  }
  
  func getSelection() -> String? {
    if let indices = selected?.indices {
      if case .selection(let range) = indices {
        let substring = textareaInput[range]
        return String(substring)
      }
    }
    
    return nil
  }
  
    var body: some View {
      ScrollView {
        Text(title)
          .padding()
        
        TextField("Input Title", text: $titleInput)
          .textFieldStyle(.roundedBorder)
          .textInputAutocapitalization(.words)
        
        TextField("Input Title", text: $titleInput)
          .textFieldStyle(.roundedBorder)
          .submitLabel(.continue)
          .onSubmit {
            assignTitle()
          }
          
        VStack(spacing: 10) {
          Text("\(name) (\(age))")
            .lineLimit(1)
            .padding()
            .background(Color.yellow)
          
          TextField("Input Name", text: $nameInput)
            .border(Color.blue, width: focusName == .name ? 2 : 0)
            .textFieldStyle(.roundedBorder)
            .padding(4)
            .focused($focusName, equals: .name)
            .onChange(of: nameInput, { oldValue, newValue in
              if newValue.count > 10 {
                nameInput = String(newValue.prefix(10))
              }
            })
            .submitLabel(.next)
            .onSubmit {
              focusName = .surname
            }
          
          TextField("Input Surname", text: $surname)
            .border(Color.blue, width: focusName == .surname ? 2 : 0)
            .textFieldStyle(.roundedBorder)
            .padding(4)
            .onChange(of: surname, { oldValue, newValue in
              if newValue.count > 10 {
                surname = String(newValue.prefix(10))
              }
            })
            .focused($focusName, equals: .surname)
          
          TextField("Input Number", text: $ageInput)
            .keyboardType(.numberPad)
            .textFieldStyle(.roundedBorder)
            .padding(4)
            .onChange(of: ageInput, { oldValue, newValue in
              if !newValue.isEmpty && (Int(newValue) == nil) {
                ageInput = oldValue
              }
            })
          
          
          HStack {
            Spacer()
            Button("Save") {
              let n = nameInput.trimmingCharacters(in: .whitespaces)
              let s = surname.trimmingCharacters(in: .whitespaces)
              let a = ageInput.trimmingCharacters(in: .whitespaces)
              
              guard !n.isEmpty else {return}
              guard !s.isEmpty else {return}
              guard !a.isEmpty && Int(a) != nil else {return}
              
              
              name = n + " " + s
              age = Int(a) ?? 0
              focusName = nil
            }
            .disabled(nameInput.isEmpty || surname.isEmpty)
          }
          
          VStack {
            TextField(
              "Input Textarea",
              text: $textareaInput,
              selection: $selected, axis: .vertical
            )
              .textFieldStyle(.roundedBorder)
              .padding(20)
              .lineLimit(5)
            
            Text(getSelection() ?? "")
              .padding()
            
            Spacer()
          }
            
        }
      }
    }
}

#Preview {
    TextFieldView()
    .padding()
}
