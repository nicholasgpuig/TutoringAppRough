//
//  SignUpButtonsView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/25/22.
//

import SwiftUI

struct NumberPicker: View {
    @Binding var birthday: Birthday
    @Binding var isShowing: Bool
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.isShowing = false
            }) {
                HStack {
                    Spacer()
                    Text("Close")
                        .padding(.horizontal, 16)
                }
            }
            HStack {
                Spacer()
                Picker(selection: $birthday.day, label: Text("")) {
                    ForEach((1..<32), id: \.self) {
                        Text("\($0)")
                            .tag($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                Picker(selection: $birthday.month, label: Text("")) {
                    ForEach((1..<13), id: \.self) {
                        Text("\($0)")
                            .tag($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                Picker(selection: $birthday.year, label: Text("")) {
                    ForEach((1990..<2023), id: \.self) {
                        Text(verbatim: "\($0)")
                            .tag($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                Spacer()
            }
        }
    }
}

struct BoxView: View {
    @Binding var trackedText: String
    var text: String
    
    var body: some View {
        TextField(text, text: $trackedText)
                .frame(width: 160, height: 50)
                .background(.gray.opacity(0.15))
                .cornerRadius(10)
                .padding(.leading, 10)
    }
}

struct HeaderView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.system(size: 25))
            .bold()
            .padding(.top, 10)
            .padding(.bottom, -1)
            .offset(x: -130)
            
    }
}

struct SignUpButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
