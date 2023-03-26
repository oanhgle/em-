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
    /*@State var posts: [Journal] = [
        Journal(id: 10, journal_id: "J0", user_id: "Coco", title: "Attending Hackabull", journal: "It is so fun here", sentiment: "joy", latitude: 28.05945, longtitude: -82.41482),
        Journal(id: 20,    journal_id: "a798e15",
                user_id: "Oanh",
                title: "Stressful Workday",
                journal: "Work was really tough today. I had a lot of deadlines to meet and didn't get much support from my boss.",
                sentiment: "anger",
                latitude: 28.05904,
                longtitude: -82.41569),
        Journal(id: 30, journal_id: "4b3",
                user_id: "Chau",
                title: "Missing My Family",
                journal: "I've been feeling homesick lately. I miss my family and wish I could be with them right now.",
                sentiment: "sadness",
                latitude: 28.05964, longtitude: -82.41592),
        Journal(id: 40, journal_id: "4a3",
                user_id: "Yen",
                title: "Exciting News!",
                journal: "I just got accepted into my dream school! I can't wait to start this new chapter of my life.",
                sentiment: "joy",
                latitude: 28.05933, longtitude: -82.41547),
        Journal(id: 50, journal_id: "4a3",
                user_id: "Dalyla",
                    title: "Disappointing Day",
                    journal: "I had plans to meet up with a friend today, but they cancelled at the last minute. I'm feeling pretty bummed out.",
                    sentiment: "sadness",
                latitude: 28.05903, longtitude: -28.05945),
    
    ]*/
    @State var posts: [Journal] = []
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
        .onAppear {
            API().getJournalForMap(completion: {(journals) in
                self.posts = journals
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

