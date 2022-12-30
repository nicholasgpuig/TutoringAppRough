//
//  Circle.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/24/22.
//

import Foundation
import SwiftUI

struct UserCircle: Identifiable {
    var id = UUID()
    var name: String
    var logo: UIImage?
    var description: String
    var location: String?
    var leader: UserInfo
    
    var tutors: [UserInfo]?
    var students: [UserInfo]?
    
    var tutorProfilePics: [UIImage] {
        var profilePics = [UIImage]()
        if let tutors = tutors {
            for tutor in tutors {
                profilePics.append(tutor.profilePic)
            }
            profilePics.append(leader.profilePic)
        }
        return profilePics
    }
    
    static let testCircles: [UserCircle] = [
    UserCircle(name: "Parsley Gang",
           logo: UIImage(named: "parsley"),
           description: "We are a group of tutors who love helping students! Request a session today!",
           leader: UserInfo.testUsers[0],
           tutors: [UserInfo.testUsers[0]],
           students: nil),
    UserCircle(name: "Strake Jesuit Math Club",
           logo: UIImage(named: "Strake-Jesuit"),
           description: "We are a group of tutors who love helping students! Request a session today!",
           leader: UserInfo.testUsers[0]),
    UserCircle(name: "Bellaire Quiz Bowl",
           logo: UIImage(named: "Bellaire-Cardinal"),
           description: "We are a group of tutors who love helping students! Request a session today!",
           leader: UserInfo.testUsers[0])
    ]
}

