//
//  ProfileView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/28/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.user.profilePic)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 150, height: 150)
                .overlay {
                    Circle()
                        .strokeBorder(.black, lineWidth: 2)
                }
                .padding(.top, 50)
            HStack {
                Text("\(viewModel.user.firstName) \(viewModel.user.lastName)")
                    .font(.title)
                    .bold()
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .padding(5)
                    .foregroundColor(AppColor.mainColor)
            }
            Button("Edit Tutoring Profile") {
                print("Done")
            }
            .font(.title)
            .bold()
            .foregroundColor(.white)
            .padding()
            .background(AppColor.mainColor)
            .cornerRadius(10)
            Spacer()
                .frame(height: 50)
            VStack {
                HStack {
                    Text("Email")
                        .font(.title2)
                        .bold()
                        .padding()
                    Spacer()
                    Text("\(viewModel.user.email)")
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(AppColor.mainColor)
                        .padding(10)
                }
                HStack {
                    Text("School")
                        .font(.title2)
                        .bold()
                        .padding()
                    Spacer()
                    Text("\(viewModel.user.school)")
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(AppColor.mainColor)
                        .padding(10)
                }
            }
            Spacer ()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserViewModel())
    }
}
