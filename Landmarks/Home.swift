//
//  Home.swift
//  Landmarks
//
//  Created by Vitor Capretz on 2019-07-25.
//  Copyright © 2019 Vitor Capretz. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]] {
        .init(
            grouping: landmarkData,
            by: { $0.category.rawValue }
        )
    }
    
    @State private var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                PageView(features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3/2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(categories.keys.sorted(), id: \.self) { category in
                    CategoryRow(categoryName: category, items: self.categories[category]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList()) {
                    Text("See all")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
        }
    }
}

#if DEBUG
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
#endif
