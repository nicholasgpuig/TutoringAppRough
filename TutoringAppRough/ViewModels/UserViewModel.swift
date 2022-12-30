//
//  UserViewModel.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/25/22.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published private var userInfo = UserInfo.testUsers
    @Published var user = UserInfo()
    @Published var circleTabIndex = 0
    
    func signUp(user: UserInfo) {
       userInfo.append(user)
    }
    
    func navTitle(_ tabIndex: Int) -> String {
        switch tabIndex {
        case 0:
            return "My Circles"
        case 1:
            return "Explore"
        case 2:
            return "Inbox"
        case 3:
            return "My Profile"
        default:
            return ""
        }
    }
}


