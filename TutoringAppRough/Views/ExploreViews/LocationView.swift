//
//  LocationView.swift
//  TutoringAppRough
//
//  Created by Nicholas Puig on 12/28/22.
//

import SwiftUI

struct LocationView: View {
    var locationName: String
    var city: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(.leading)
                .foregroundColor(AppColor.mainColor)
            Text("\(locationName)")
                .font(.title2)
                .bold()
                .padding(.vertical)
            Text("\(city)")
            Spacer()
        }
        .background(AppColor.myGray)
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(locationName: "McDonalds", city: "Houston, TX")
    }
}
