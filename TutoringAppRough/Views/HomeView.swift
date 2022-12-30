//
//  HomeView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/26/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State var tabIndex: Int = 0
    
    var body: some View {
        NavigationStack{
            TabView(selection: $tabIndex) {
                CirclesView()
                    .tabItem({
                        Label("Circles", systemImage: "circle.dashed")
                    }).tag(0)
                ExploreView()
                    .tabItem({
                        Label("Explore", systemImage: "globe.asia.australia")
                    }).tag(1)
                MessageView()
                    .tabItem({
                        Label("Messages", systemImage: "message")
                    }).tag(2)
                ProfileView()
                    .tabItem({
                        Label("Profile", systemImage: "person")
                    }).tag(3)
            }
            .navigationTitle(viewModel.navTitle(tabIndex))
            //.navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarBackButtonHidden(true)
        .environmentObject(viewModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserViewModel())
    }
}
