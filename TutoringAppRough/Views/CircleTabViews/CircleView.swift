//
//  CircleView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/27/22.
//

import SwiftUI

struct CircleView: View {
    @EnvironmentObject var viewModel: UserViewModel
    var logo: UIImage
    var circle: UserCircle
    
    var body: some View {
        GeometryReader { shape in
            MyShape(myObj: shape)
                .foregroundColor(AppColor.mainColor)
                .coordinateSpace(name: "Circle")
                .overlay {
                    Image("parsley")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: shape.frame(in: .named("Circle")).midX * 0.12)
                        .overlay {
                            Circle()
                                .strokeBorder(.black, lineWidth: 2)
                        }
                    
                }
            
        }
        .frame(width: 200, height: 200)
        .background(AppColor.myGray)
    }
}

struct MyShape : Shape {
    var myObj: GeometryProxy
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let center = CGPoint(x: myObj.frame(in: .local).midX, y: myObj.frame(in: .local).midY)
            p.addArc(center: center, radius: 20, startAngle: .degrees(270), endAngle: .degrees(-90), clockwise: true)

        return p.strokedPath(.init(lineWidth: 3))
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(logo: UIImage(named: "parsley")!, circle: UserCircle(name: "Team", description: "", leader: UserInfo(firstName: "Carter",
                                                                                                                        lastName: "Abel",                                                       email: "cabel@strakejesuit.org",
                                                                                                                        birthday: Birthday(year: 2005, month: 2, day: 21),
                                                                                                                        gender: .male,
                                                                                                                        profilePic: UIImage(named: "Carter-Abel")!,
                                                                                                                        school: "Strake Jesuit",
                                                                                                                        grade: "11",
                                                                                                                        state: .texas,
                                                                                                                        tutorCircles: [0],
                                                                                                                        studentCircles: [1],
                                                                                                                   tutoringProfile: nil), tutors: [UserInfo(firstName: "Oscar",
                                                                                                                                                            lastName: "Valdes",
                                                                                                                                                            email: "ovaldez@strakejesuit.org",
                                                                                                                                                            birthday: Birthday(year: 2005, month: 9, day: 18),
                                                                                                                                                            gender: .male,
                                                                                                                                                            profilePic: UIImage(named: "Oscar-Valdes")!,
                                                                                                                                                            school: "Strake Jesuit",
                                                                                                                                                            grade: "11",
                                                                                                                                                            state: .texas,
                                                                                                                                                            tutorCircles: [2],
                                                                                                                                                            studentCircles: [1],
                                                                                                                                                           tutoringProfile: nil)]))
            .environmentObject(UserViewModel())
    }
}
