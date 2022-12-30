//
//  ExploreCircleView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/28/22.
//

import SwiftUI

struct ExploreCircleView: View {
    var circleIndices: [Int]
    var circles: [UserCircle]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(circleIndices, id: \.self) { index in
                VStack {
                    Text("\(circles[index].name)")
                        .padding()
                        .font(.system(size: 30))
                        .bold()
                        .frame(width: 300)
                        .foregroundColor(AppColor.mainColor)
                    HStack {
                        Image(systemName: "circle.dotted")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .padding(.horizontal)
                            .foregroundColor(AppColor.mainColor)
                            .overlay{
                                if let profilePic = circles[index].logo {
                                    Image(uiImage: profilePic)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Circle())
                                        .frame(width: 65)
                                        .overlay {
                                            Circle()
                                                .strokeBorder(.black, lineWidth: 2)
                                        }
                                }
                            }
                        VStack {
                            Text("\(circles[index].description)")
                                .padding()
                            Spacer()
                        }
                        .frame(height: 150)
                        .padding(.horizontal, 10)
                        .background(.white)
                        .cornerRadius(10)
                    }
                }
            }
            .padding()
            .frame(maxWidth: 350, maxHeight: 300)
            .background(AppColor.myGray)
            .cornerRadius(10)
        }
    }
}

struct ExploreCircleView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserViewModel())
    }
}
