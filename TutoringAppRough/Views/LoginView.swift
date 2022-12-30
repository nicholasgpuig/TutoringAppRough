//
//  LoginView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/24/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = UserViewModel()
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack() {
            VStack {
                Image("OurLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .toolbar{
                        ToolbarItemGroup(placement: .principal) {
                            HStack {
                                Spacer()
                                Image("QuestionMarkTeal")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                    Form {
                        TextField("Email", text: $email)
                        TextField("Password", text: $password)
                        }
                    .scrollContentBackground(.hidden)
                    .offset(y: -15)
                Button("Sign In") {
                    print("Nothing")
                }
                .font(.system(size: 30))
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
                .background(AppColor.mainColor)
                .border(AppColor.mainColor, width: 2)
                .cornerRadius(20)
                .foregroundColor(Color.white)
                .offset(y: -300)
                .bold().italic()
                HStack {
                    NavigationLink("Sign Up", destination: {
                        SignUpView()
                    })
                        .foregroundColor(.blue)
                    Divider()
                        .frame(height: 25)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    Text("Forgot Password?")
                        .foregroundColor(.blue)
                }
                .offset(y: -300)
            }
        }
        .environmentObject(viewModel)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
