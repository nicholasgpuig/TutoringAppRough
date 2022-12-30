//
//  CirclesView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/27/22.
//

import SwiftUI

struct CirclesView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State var calendarShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                            Button(action: { print("we good") }, label: {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(AppColor.mainColor)
                            })
                            .offset(x: 150)
                            .padding(.vertical, -40)
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .padding()
                            .foregroundColor(AppColor.myGray)
                            .frame(height:95)
                        HStack {
                            Button(action: {
                                viewModel.circleTabIndex = 0
                            }, label: {
                                CustomTabView(selectedIndex: $viewModel.circleTabIndex, tabIndex: 0, text: "Student")
                            })
                            Divider()
                                .frame(height: 50)
                            Button(action: {
                                viewModel.circleTabIndex = 1
                            }, label: {
                                CustomTabView(selectedIndex: $viewModel.circleTabIndex, tabIndex: 1, text: "Tutor")
                            })
                        }
                    }
                    switch viewModel.circleTabIndex {
                    case 0:
                        StudentCirclesView()
                    default:
                        TutorCirclesView()
                    }
                    Spacer()
                }
                Circle()
                    .foregroundColor(AppColor.mainColor)
                    .frame(width: 70)
                    .overlay {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .shadow(radius: 5)
                            .foregroundColor(.white)
                            .frame(width: 30)
                    }
                    .offset(x: 140, y: 260)
            }
            .environmentObject(viewModel)
        }
    }
}


struct CustomTabView: View {
    @Binding var selectedIndex: Int
    var tabIndex: Int
    var text: String
    
    var body: some View {
        switch selectedIndex {
        case tabIndex:
            Text(text)
                .bold()
                .padding()
                .padding(.horizontal, 30)
                .foregroundColor(.white)
                .background(AppColor.mainColor)
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding(.horizontal, 10)
        default:
            Text(text)
                .bold()
                .padding()
                .padding(.horizontal, 30)
                .foregroundColor(.black)
                .cornerRadius(20)
                .padding(.horizontal, 10)
        }
        
    }
}


struct CirclesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserViewModel())
    }
}
