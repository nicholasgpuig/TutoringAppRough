//
//  MessagesView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/28/22.
//

import SwiftUI

struct MessagesView: View {
    var user: UserInfo
    
    var body: some View {
        VStack {
            HStack {
                Text("\(user.firstName) \(user.lastName)")
                    .bold()
                    .font(.title2)
                    .padding(.horizontal)
                Spacer()
            }
            HStack {
                Image(uiImage: user.profilePic)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 75,height: 75)
                    .padding(.horizontal)
                Text("Hey what time were u thinking...")
                    .foregroundColor(.gray)
                    .offset(y: -20)
                Spacer()
            }
            Divider()
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView(user: UserInfo.testUsers[0])
    }
}
