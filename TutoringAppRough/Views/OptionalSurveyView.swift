//
//  OptionalSurveyVIew.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/26/22.
//

import SwiftUI

struct OptionalSurveyView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        NavigationStack() {
            VStack{
                Image("Paper-Pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250,height: 250)
                Text("Interested in Tutoring?")
                    .font(.title)
                    .bold()
                    .padding(20)
                Text("Fill out some information to set up your tutoring profile, giving students information about you and your skills")
                    .multilineTextAlignment(.center)
                
                HStack{
                    NavigationLink("Skip", destination: {
                        HomeView()
                    })
                        .padding(15)
                        .padding(.horizontal, 15)
                        .border(.black, width: 1.5)
                        .cornerRadius(5)
                        .foregroundColor(.black)
                    Divider()
                        .frame(height: 60)
                        .padding()
                    NavigationLink("Go!", destination: TutoringProfileFormView())
                        .padding(10)
                        .padding(.horizontal, 15)
                        .border(AppColor.mainColor)
                        .background(AppColor.mainColor)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                }
                .offset(y: 100)
            }
        }
        .environmentObject(viewModel)
        .navigationBarBackButtonHidden(true)
    }
}

struct OptionalSurveyVIew_Previews: PreviewProvider {
    static var previews: some View {
        OptionalSurveyView()
            .environmentObject(UserViewModel())
    }
}
