//
//  MessageView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/27/22.
//

import SwiftUI

struct MessageView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<3) { num in
                    MessagesView(user: UserInfo.testUsers[num])
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserViewModel())
    }
}
