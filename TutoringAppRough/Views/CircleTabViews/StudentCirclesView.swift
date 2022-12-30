//
//  StudentCirclesView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/27/22.
//

import SwiftUI

struct StudentCirclesView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        if let circles = viewModel.user.studentCircles {
            ScrollView {
                CircleWidgetView(circleIndices: circles, circles: UserCircle.testCircles)
            }
        }
    }
}

struct StudentCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        CirclesView()
            .environmentObject(UserViewModel())
    }
}
