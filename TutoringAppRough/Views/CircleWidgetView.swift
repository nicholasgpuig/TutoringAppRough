//
//  CircleWidgetView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/28/22.
//

import SwiftUI

struct CircleWidgetView: View {
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
                            Text("Upcoming...")
                                .font(.system(size: 20))
                                .bold()
                                .underline()
                                .padding()
                            ScrollView {
                                ForEach(0..<4) { num in
                                    HStack {
                                        Text("12/2\(num): Student \(num + 1)")
                                            .bold()
                                            .padding(5)
                                            .frame(width: 130)
                                            .background(AppColor.myGray)
                                            .cornerRadius(10)
                                    }
                                }
                                
                            }
                            Spacer()
                        }
                        .frame(height: 150)
                        .padding(.horizontal)
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

struct CircleWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserViewModel())
    }
}
