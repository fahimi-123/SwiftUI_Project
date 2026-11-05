//
//  MainView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 11/08/2026.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            NavigationStack {
                NotesHubView()
            }
            .tabItem {
                Label("NotesHub", systemImage: "book.closed.fill")
            }
            
            NavigationStack {
                BuddiesChatView()
            }
            .tabItem {
                Label("Buddy", systemImage: "hands.clap.fill")
            }
            
            NavigationStack {
                MarketPlaceView()
            }
            .tabItem {
                Label("Marketplace", systemImage: "bag.fill")
            }
            
            NavigationStack {
                CommunityView()
            }
            .tabItem {
                Label("Community", systemImage: "person.3.fill")
            }
        }
    }
}

#Preview {
    MainView()
}
