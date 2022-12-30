//
//  UserInfo.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/24/22.
//

import Foundation
import SwiftUI

struct UserInfo: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var email: String
    var birthday: Birthday
    var gender: Gender
    
    var profilePic: UIImage
    
    var school: String
    var grade: String
    var state: USState

    var tutorCircles: [Int]?
    var studentCircles: [Int]?
    
    var tutoringProfile: TutoringProfile?
    
    
    enum Gender: String, CaseIterable {
        case male = "Male"
        case female = "Female"
        case other = "Other"
        case none = "Prefer not to say"
    }
    
    init() {
        self.init(firstName: "", lastName: "", email: "", birthday: Birthday(year: 2022, month: 1, day: 1), gender: .none, profilePic: UIImage(named: "Blank-User")!, school: "", grade: "", state: .alabama, tutorCircles: [2], studentCircles: [0,1], tutoringProfile: nil)
    }
    
    init(firstName: String, lastName: String, email: String, birthday: Birthday, gender: Gender, profilePic: UIImage, school: String, grade: String, state: USState, tutorCircles: [Int]?, studentCircles: [Int]?, tutoringProfile: TutoringProfile?) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.birthday = birthday
        self.gender = gender
        self.profilePic = profilePic
        self.school = school
        self.grade = grade
        self.state = state
        self.tutorCircles = tutorCircles
        self.studentCircles = studentCircles
        self.tutoringProfile = tutoringProfile
    }
    
    enum USState: String, CaseIterable {
        case alabama = "Alabama"
        case alaska = "Alaska"
        case arizona = "Arizona"
        case arkansas = "Arkansas"
        case california = "California"
        case colorado = "Colorado"
        case connecticut = "Connecticut"
        case delaware = "Delaware"
        case florida = "Florida"
        case georgia = "Georgia"
        case hawaii = "Hawaii"
        case idaho = "Idaho"
        case illinois = "Illinois"
        case indiana = "Indiana"
        case iowa = "Iowa"
        case kansas = "Kansas"
        case kentucky = "Kentucky"
        case louisiana = "Louisiana"
        case maine = "Maine"
        case maryland = "Maryland"
        case massachusetts = "Massachusetts"
        case michigan = "Michigan"
        case minnesota = "Minnesota"
        case mississippi = "Mississippi"
        case missouri = "Missouri"
        case montana = "Montana"
        case nebraska = "Nebraska"
        case nevada = "Nevada"
        case newHampshire = "New Hampshire"
        case newJersey = "New Jersey"
        case newMexico = "New Mexico"
        case newYork = "New York"
        case northCarolina = "North Caroline"
        case northDakota = "North Dakota"
        case ohio = "Ohio"
        case oklahoma = "Oklahoma"
        case oregon = "Oregon"
        case pennsylvania = "Pennsylvania"
        case rhodeIsland = "Rhode Island"
        case southCarolina = "South Carolina"
        case southDakota = "South Dakota"
        case tennessee = "Tennessee"
        case texas = "Texas"
        case utah = "Utah"
        case vermont = "Vermont"
        case virginia = "Virginia"
        case washington = "Washington"
        case westVirginia = "West Virginia"
        case wisconsin = "Wisconsin"
        case wyoming = "Wyoming"
        case territory = "US Territory"
     
    }
    static var testUsers = [
        UserInfo(firstName: "Zach",
                 lastName: "Jones",
                 email: "zjones@strakejesuit.org",
                 birthday: Birthday(year: 2004, month: 8, day: 1),
                 gender: .male,
                 profilePic: UIImage(named: "Zach-Jones")!,
                 school: "Strake Jesuit",
                 grade: "11",
                 state: .texas,
                tutorCircles: [0, 1],
                studentCircles: nil,
                tutoringProfile:
                TutoringProfile(subjects: ["AP Calc BC", "AP Bio", "AP Econ", "Precalculus"],
                                bio: "Hi I'm Zach and I am strong in math.",
                                rating: 5.0,
                                availability: .both,
                               hasVideo: false)
                ),
        UserInfo(firstName: "Carter",
                     lastName: "Abel",
                     email: "cabel@strakejesuit.org",
                     birthday: Birthday(year: 2005, month: 2, day: 21),
                     gender: .male,
                     profilePic: UIImage(named: "Carter-Abel")!,
                     school: "Strake Jesuit",
                     grade: "11",
                     state: .texas,
                     tutorCircles: [0],
                     studentCircles: [1],
                tutoringProfile: nil),
            UserInfo(firstName: "Oscar",
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
                    tutoringProfile: nil)
        ]
}

struct Birthday: Hashable {
    var year: Int
    var month: Int
    var day: Int
}

struct TutoringProfile {
    var subjects: [String]
    var bio: String
    var rating: Double
    var availability: Availability
    var hasVideo: Bool
    
    var cachesDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    // Write video to this path when they select it
    var videoPath: URL {
        cachesDirectory.appendingPathComponent("foo.mov")
    }
    enum Availability: String, CaseIterable {
        case online = "Online"
        case inPerson = "In Person"
        case both = "Both"
    }
}



