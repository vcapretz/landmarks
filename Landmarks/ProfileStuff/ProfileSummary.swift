//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Vitor Capretz on 2019-07-30.
//  Copyright © 2019 Vitor Capretz. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notifications: \(self.profile.prefersNotifications ? "On" : "Off")")
            
            Text("Seasonal photos: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("Goal date \(self.profile.goalDate, formatter: Self.goalFormatter)")
            
            VStack(alignment: .leading) {
                Text("Completed badges")
                    .font(.headline)
                
                
                ScrollView {
                    HStack {
                        HikeBadge(name: "First hike")
                        
                        HikeBadge(name: "Earth day")
                            .hueRotation(Angle(degrees: 90))
                        
                        HikeBadge(name: "Tenth hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
                .frame(height: 140)
            }
            
            VStack(alignment: .leading) {
                Text("Recent hikes")
                    .font(.headline)
                
                HikeView(hike: hikeData[0])
            }
        }
    }
}

#if DEBUG
struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
#endif
