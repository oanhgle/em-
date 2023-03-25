//
//  Home.swift
//  em-
//
//  Created by Oanh Le on 3/21/23.
//

import SwiftUI
struct Home: View {
    
    // Hiding tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var selectedTab: String = "house"
    var body: some View {
        ZStack(alignment: .bottom) {
            // Tab view
            TabView(selection: $selectedTab) {
                ExploreView()
                    .tag("house")
                FriendFeedView()
                    .tag("heart")
                MapView().ignoresSafeArea()
                    .tag("map")
                ProfileView()
                    .tag("person")
            }
            RoundedRectangle(cornerRadius: 40)
                .fill(.ultraThinMaterial)
                      .frame(width: .infinity, height: 75)
                      .padding(.horizontal, 17)
                      .padding(.vertical, 27)
            
            // Custom tab bar
            CustomTabBar(selectedTab: $selectedTab)
            
        }
        .ignoresSafeArea()
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

