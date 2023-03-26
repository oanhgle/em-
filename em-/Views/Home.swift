//
//  Home.swift
//  em-
//
//  Created by Oanh Le on 3/21/23.
//

import SwiftUI
import CoreLocation

struct Home: View {
    @StateObject var locationManager = LocationManager()
    @State var posts: [Journal] = [
        Journal(id: 10, journal_id: "J0", user_id: "Coco", title: "Attending Hackabull", journal: "locationManager(_:didChangeAuthorization:) notDetermined locationManager(_:didChangeAuthorization:) notDetermined", sentiment: "anger", latitude: 28.05945, longtitude: -82.41482),
        Journal(id: 20,journal_id: "J1", user_id: "Skye", title: "Attending Hackabull", journal: "locationManager(_:didChangeAuthorization:) notDetermined locationManager(_:didChangeAuthorization:) notDetermined", sentiment: "disgust", latitude: 28.05945, longtitude: -82.40482),
        Journal(id: 30,journal_id: "J1", user_id: "Sydney Ng.", title: "Attending Hackabull", journal: "locationManager(_:didChangeAuthorization:) notDetermined locationManager(_:didChangeAuthorization:) notDetermined", sentiment: "joy", latitude: 28.05964, longtitude: -82.41236)
    ]
    
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
                FriendFeedView(posts: posts)
                    .tag("heart")
                MapView(currentLocation: locationManager.lastLocation, posts: posts).ignoresSafeArea()
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
            CustomTabBar(selectedTab: $selectedTab, currentLocation: locationManager.lastLocation) 
        }
        .ignoresSafeArea()
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

