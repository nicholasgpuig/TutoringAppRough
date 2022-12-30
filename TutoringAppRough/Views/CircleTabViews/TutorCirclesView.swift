//
//  TutorCirclesView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/28/22.
//

import SwiftUI

struct TutorCirclesView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        if let circles = viewModel.user.tutorCircles {
            ScrollView {
                CircleWidgetView(circleIndices: circles, circles: UserCircle.testCircles)
            }
        }
    }
}

struct TutorCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView()
            .environmentObject(UserViewModel())
    }
}
