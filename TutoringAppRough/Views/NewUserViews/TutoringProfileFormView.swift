//
//  TutoringProfileFormView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/26/22.
//

import SwiftUI
import PhotosUI
import AVKit

struct TutoringProfileFormView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State var newProfile: TutoringProfile = TutoringProfile(subjects: [""], bio: "", rating: 0.0, availability: .both, hasVideo: false)
    
    @State var currentSubject: String = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        SectionHeaderView(text: "Show off your strengths!")
                        Text("Students will be shown the information in your tutoring profile.")
                        Divider()
                            .padding()
                    }
                    VStack {
                        SectionHeaderView(text: "Subjects")
                            .padding(.bottom, -10)
                        HStack {
                            Text("Enter any subjects you're willing to teach so that students can know your specialties.")
                                .frame(maxWidth: 275)
                                .padding(.horizontal, 15)
                            Spacer()
                        }
                        Section{
                            HStack {
                                TextField("Enter...", text: $currentSubject)
                                    .frame(maxWidth: 130)
                                    .padding()
                                    .background(.black.opacity(0.1))
                                    .cornerRadius(20)
                                    .padding()
                                    .padding(.top, -105)
                                    .overlay(content: {
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 25)
                                            .foregroundColor(.blue)
                                            .padding(.top, -75)
                                            .padding(.leading, 100)
                                            .onTapGesture(perform: {
                                                newProfile.subjects.append(currentSubject)
                                                currentSubject = ""
                                                newProfile.subjects = newProfile.subjects.filter {
                                                    !$0.isEmpty
                                                }
                                            })
                                            
                                    })
                                List {
                                    ForEach(newProfile.subjects, id: \.self) { item in
                                        Text(item)
                                    }
                                    .onDelete(perform: {
                                        newProfile.subjects.remove(atOffsets: $0)
                                    })
                                }
                                .cornerRadius(20)
                                .frame(minHeight: 200)
                                Spacer()
                                    
                            }
                        } footer: {
                            Text("Note: Swipe left to delete items.")
                                .offset(x: 90)
                                .font(.footnote)
                        }
                       Divider()
                            .padding()
                    }
                    
                    SectionHeaderView(text: "Bio")
                            .padding(.vertical, -20)
                    Text("Tell your students about yourself.")
                        .offset(x: -55)
                        .padding()
                        .padding(.top, -15)
                    TextEditor(text: $newProfile.bio)
                        .frame(maxWidth: 300, minHeight: 100)
                        .padding(15)
                        .border(.black.opacity(0.2), width: 5)
                        .cornerRadius(10)
                        .offset(x: -10)
                    Divider()
                        .padding()
                    VStack {
                        SectionHeaderView(text: "Video Profile")
                        Text("Optionally, you can add a short video about yourself, which also helps prospective students to verify your identity.")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 15))
                            .padding(.top, -10)
                        PhotosPicker(selection: $selectedItem, matching: .videos ) {
                            Label("Choose video", systemImage: "video")
                                .padding()
                                .border(AppColor.mainColor)
                                .background(AppColor.mainColor)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .onChange(of: selectedItem) { newItem in
                                        Task {
                                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                                selectedPhotoData = data
                                                let videoData = Data(selectedPhotoData!)
                                                try videoData.write(to: newProfile.videoPath)
                                                newProfile.hasVideo = true
                                                
                                            }
                                        }
                                    }
                        }
                        if selectedItem != nil {
                            VideoPlayer(player: AVPlayer(url: newProfile.videoPath))
                                .frame(maxWidth: 300, minHeight: 200)
                                .cornerRadius(20)
                                .padding()
                        } else {
                            Image(systemName: "nosign")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 200)
                                .background(AppColor.myGray)
                                .cornerRadius(20)
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    Divider()
                    NavigationLink("Complete", destination: HomeView())
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .border(AppColor.mainColor)
                        .background(AppColor.mainColor)
                        .cornerRadius(10)
                        .offset(y: 30)
                        .simultaneousGesture(TapGesture().onEnded {
                            viewModel.user.tutoringProfile = newProfile
                                    })
                }
            }
            .environmentObject(viewModel)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitle("Tutoring Profile")
            .toolbarBackground(AppColor.mainColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SectionHeaderView: View {
    var text: String
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 25))
                .bold()
                .padding()
            Spacer()
        }
    }
}

struct TutoringProfileFormView_Previews: PreviewProvider {
    static var previews: some View {
        TutoringProfileFormView()
            .environmentObject(UserViewModel())
    }
}
