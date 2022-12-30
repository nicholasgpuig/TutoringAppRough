//
//  SignUpView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/24/22.
//

import SwiftUI
import PhotosUI

struct SignUpView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State var sheetShowing: Bool = false
    @State var schoolTrue: Bool = false
    
    @State var selectedItem: PhotosPickerItem?
    @State var selectedPhotoData: Data?
    
    var body: some View {
        NavigationStack {
                ScrollView {
                        VStack {
                            VStack {
                                HeaderView(text: "Name")
                                HStack {
                                    BoxView(trackedText: $viewModel.user.firstName, text: "First")
                                    Spacer().frame(width: 15)
                                    BoxView(trackedText: $viewModel.user.lastName, text: "Last")
                                }
                                Divider()
                                    .padding()
                            }
                            VStack {
                                HeaderView(text: "Email")
                                TextField("", text: $viewModel.user.email)
                                        .frame(width: 300,height: 50)
                                        .background(.gray.opacity(0.15))
                                        .cornerRadius(10)
                                        .offset(x: -15)
                                Divider()
                                    .padding()
                            }
                            VStack {
                                HeaderView(text: "Birthday")
                                    .padding(.leading, 35)
                                    .padding(.top, -10)
                                Button(action: {
                                    sheetShowing = true
                                }, label: {
                                    Text(verbatim: "Enter your birthday: \(viewModel.user.birthday.month)/\(viewModel.user.birthday.day)/\(viewModel.user.birthday.year)")
                                })
                                    .offset(x: -50)
                                    .padding()
                                    .padding(.bottom, -20)
                                Spacer(minLength: 300)
                                Divider()
                                    .offset(y: -260)
                            }
                            VStack {
                                HeaderView(text: "Gender")
                                    .offset(x: 10,y: -185)
                                HStack {
                                    Picker(selection: $viewModel.user.gender,
                                           label: Text(viewModel.user.gender.rawValue),
                                    content: {
                                        ForEach(UserInfo.Gender.allCases, id: \.self) { value in
                                            Text(value.rawValue).tag(value.rawValue)
                                        }
                                    })
                                    .offset(x: 25,y: -180)
                                    Spacer()
                                }
                                Divider()
                                    .offset(y: -175)
                            
                            }
                            .offset(y: -80)
                            VStack {
                             HeaderView(text: "Profile Picture")
                                    .padding(5)
                                    .offset(x: 50)
                            HStack {
                                    Text("Please select a profile picture.")
                                        .padding(.horizontal)
                                        .offset(x: 22)
                                    Spacer()
                                }
                                if let selectedPhotoData,
                                   let image = UIImage(data: selectedPhotoData) {
                                    Image(uiImage: image)
                                            .resizable()
                                            .cornerRadius(50)
                                            .padding(.all, 4)
                                            .frame(width: 100, height: 100)
                                            .background(Color.black.opacity(0.2))
                                            .aspectRatio(contentMode: .fill)
                                            .clipShape(Circle())
                                            .padding(8)
                                }
                                PhotosPicker(selection: $selectedItem, matching: .images) {
                                    Label("Select a photo", systemImage: "photo")
                                }
                                .tint(AppColor.mainColor)
                                .controlSize(.large)
                                .buttonStyle(.borderedProminent)
                                    .onChange(of: selectedItem) { newItem in
                                        Task {
                                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                                selectedPhotoData = data
                                            }
                                            if let selectedPhotoData = selectedPhotoData {
                                                viewModel.user.profilePic = UIImage(data: selectedPhotoData)!
                                            }
                                        }
                                    }
                                Divider()
                                    .padding()
                            }
                            .offset(y: -270)
                            
                            VStack {
                                HeaderView(text: "State")
                                    .padding()
                                Picker("", selection: $viewModel.user.state) {
                                    ForEach(UserInfo.USState.allCases, id: \.self) { usState in
                                        Text(usState.rawValue).tag(usState.rawValue)
                                    }
                                }
                                .padding(.bottom, -50)
                                .offset(x: -117, y: -10)
                                Divider()
                                .padding(.top, 35)
                                
                            }
                            .offset(y: -270)
                            VStack {
                                HeaderView(text: "Grade")
                                    .offset(x: 5)
                                Picker(viewModel.user.grade, selection: $viewModel.user.grade) {
                                    ForEach((1..<13), id: \.self) { value in
                                        Text("\(value)").tag("\(value)")
                                    }
                                }
                                .offset(x: -142)
                                Divider()
                            }
                            .offset(y: -270)
                            VStack {
                                HeaderView(text: "School")
                                    .offset(x: 10)
                                    .padding(.bottom, 10)
                                TextField("", text: $viewModel.user.school)
                                        .frame(width: 300,height: 50)
                                        .background(.gray.opacity(0.15))
                                        .cornerRadius(10)
                                        .offset(x: -15)
                                        .onTapGesture(perform: {
                                            schoolTrue = true
                                        })
                                        .overlay(content: {
                                            Image(systemName: "magnifyingglass")
                                                .offset(x: -140)
                                                .opacity(schoolTrue ? 0 : 0.35)
                                        })
                                Divider()
                                    .padding()
                            }
                            .offset(y: -270)
                            Section {
                                NavigationLink("Sign Up", destination: {
                                    OptionalSurveyView()
                                })
                                .font(.system(size: 30))
                                .padding(.horizontal, 80)
                                .padding(.vertical, 20)
                                .background(AppColor.mainColor)
                                .border(AppColor.mainColor, width: 2)
                                .cornerRadius(20)
                                .foregroundColor(Color.white)
                                .bold().italic()
                            }
                        header: {
                                Text("By tapping Sign Up, you agree to our Terms, Data Policy, and Cookies Policy.")
                                    .font(.system(size: 13))
                            }
                            .offset(y: -260)
                        }
            }
                .toolbarColorScheme(.dark, for: .navigationBar)
                .navigationBarTitle("Sign Up")
                .toolbarBackground(AppColor.mainColor, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .overlay(content: {
                    NumberPicker(birthday: $viewModel.user.birthday, isShowing: $sheetShowing)
                        .animation(.easeInOut(duration: 1.0), value: 1)
                        .background(Color(.systemGray6))
                        .offset(x: self.sheetShowing ? 0 : UIScreen.main.bounds.width, y: 200)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                })
        }
        .environmentObject(viewModel)
        
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(UserViewModel())
    }
}

