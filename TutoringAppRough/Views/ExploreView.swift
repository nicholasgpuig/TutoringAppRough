//
//  ExploreView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/28/22.
//

import SwiftUI

struct ExploreView: View {
    var recCircles = [UserCircle(name: "St. John's TFA", logo: UIImage(named: "Uzi"), description: "Welcome to the St. John's Tutors For All organization! We're here to help.", leader: UserInfo.testUsers[0]),
                      UserCircle(name: "Mounds View NHS", logo: UIImage(named: "Riot") , description: "We're a committed group of high achieving students who want to help.", leader: UserInfo.testUsers[0]),
                      UserCircle(name: "NYC SEAS Academy", logo: UIImage(named: "Hundred-Acre-Wrist"), description: "We're a group of students at a specialized high school in New York City, happy to tutor any students nationwide!", leader: UserInfo.testUsers[0])]
    @State var searchQuery = ""
    var locations = [["McDonald's", "Houston, TX"], ["YMCA","Cypress, TX"], ["Bellaire Public Library","Bellaire, TX"]]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        TextField("Search", text: $searchQuery)
                            .padding()
                            .frame(width: 350, height: 40)
                            .background(AppColor.myGray)
                            .cornerRadius(10)
                        Image(systemName: "calendar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(5)
                            .foregroundColor(AppColor.mainColor)
                    }
                    SectionHeaderView(text: "Locations")
                    ForEach(locations, id: \.self) { location in
                        LocationView(locationName: location[0], city: location[1])
                    }
                }
                VStack {
                    SectionHeaderView(text: "Recommended")
                    ExploreCircleView(circleIndices: [0,1,2], circles: recCircles)
                }
                
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserViewModel())
    }
}
