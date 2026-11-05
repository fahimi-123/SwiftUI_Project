//
//  CommunityView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 13/08/2026.
//

import SwiftUI

struct CommunityView: View {
    
    @ObservedObject var authManager = UserAuthManager.shared
    @State private var searchText = ""
    @State private var showCreateSheet = false
    @State private var showAllCommunitiesSheet = false
    
    @State private var selectedCommunity: CommunityModel? = nil
    
    let myCommunities = [
        CommunityModel(
            title: "PKP SIDANG 26/27",
            category: "Announcement",
            isAnnouncement: true,
            time: "10:30 AM",
            unreadCount: 2,
            isPinned: true,
            hasShareBadge: true,
            iconName: "PKP"
        ),
        CommunityModel(
            title: "KHAR SPORTS CLUB",
            category: "Sports",
            isAnnouncement: false,
            time: "Yesterday",
            unreadCount: 4,
            isPinned: true,
            hasShareBadge: false,
            iconName: "KharSports"
        ),
        CommunityModel(
            title: "KHAR RUMAH KITA",
            category: "Residential College",
            isAnnouncement: false,
            time: "Yesterday",
            unreadCount: 1,
            isPinned: true,
            hasShareBadge: false,
            iconName: "KharRumahKita"
        ),
        CommunityModel(
            title: "FASI CS240",
            category: "Academic",
            isAnnouncement: false,
            time: "2 days ago",
            unreadCount: 0,
            isPinned: false,
            hasShareBadge: false,
            iconName: "Fasi"
        )
    ]
    
    let allCommunities = [
        CommunityModel(
            title: "PKP SIDANG 26/27",
            category: "Announcement",
            isAnnouncement: true,
            time: "10:30 AM",
            unreadCount: 2,
            isPinned: true,
            hasShareBadge: true,
            iconName: "PKP"
        ),
        CommunityModel(
            title: "KHAR SPORTS CLUB",
            category: "Sports",
            isAnnouncement: false,
            time: "Yesterday",
            unreadCount: 4,
            isPinned: true,
            hasShareBadge: false,
            iconName: "KharSports"
        ),
        CommunityModel(
            title: "KHAR RUMAH KITA",
            category: "Residential College",
            isAnnouncement: false,
            time: "Yesterday",
            unreadCount: 1,
            isPinned: true,
            hasShareBadge: false,
            iconName: "KharRumahKita"
        ),
        CommunityModel(
            title: "FASI CS240",
            category: "Academic",
            isAnnouncement: false,
            time: "2 days ago",
            unreadCount: 0,
            isPinned: false,
            hasShareBadge: false,
            iconName: "Fasi"
        )
    ]
    
    var filteredCommunities: [CommunityModel] {
        if searchText.isEmpty {
            return allCommunities
        }
        return allCommunities.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.category.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            // Split Background: Blue top for header curve visibility + White bottom for clean tab bar
            VStack(spacing: 0) {
                Color.color
                    .frame(height: 320)
                Color.white
            }
            .ignoresSafeArea()
            
            // MARK: - MAIN SCROLL VIEW
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    // MARK: - CENTERED APP LOGO HEADER
                    HStack {
                        Spacer()
                        
                        HStack(spacing: 0) {
                            Text("Campus")
                                .foregroundStyle(.white)
                            Text("Buddy")
                                .foregroundStyle(.orange)
                        }
                        .font(.system(size: 26, weight: .bold))
                        
                        Spacer()
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                    
                    
                    // MARK: - COMMUNITY TITLE BLOCK (TOP PLUS BUTTON REMOVED)
                    VStack(alignment: .leading, spacing: 14) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Community")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Text("Connect, share and stay updated with your campus communities")
                                .font(.system(size: 13.5, weight: .regular))
                                .foregroundStyle(.white.opacity(0.9))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        // MARK: - SEARCH BAR
                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(.gray)
                            
                            TextField("Search Communities....", text: $searchText)
                                .font(.system(size: 14))
                            
                            if !searchText.isEmpty {
                                Button {
                                    searchText = ""
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .frame(height: 48)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.1), radius: 6, y: 3)
                        .padding(.top, 4)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 22)
                    
                    
                    // MARK: - WHITE CONTENT CONTAINER (CURVED TOP SHAPE VISIBLE OVER BLUE)
                    VStack(spacing: 24) {
                        
                        // MARK: 1. MY COMMUNITIES SECTION
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Text("My Communities")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(Color.color)
                                
                                Spacer()
                                
                                Button {
                                    showAllCommunitiesSheet = true
                                } label: {
                                    Text("See all")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundStyle(.orange)
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            // Horizontal ScrollView for My Communities + Add Community Plus Card at the end
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 14) {
                                    ForEach(myCommunities) { community in
                                        Button {
                                            if authManager.requireAuth(for: "community group discussions") {
                                                selectedCommunity = community
                                            }
                                        } label: {
                                            MyCommunityCard(community: community)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                    
                                    // PLUS CREATE BUTTON AT THE END OF MY COMMUNITIES SCROLLVIEW
                                    AddCommunityCard {
                                        if authManager.requireAuth(for: "creating communities") {
                                            showCreateSheet = true
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 4)
                            }
                        }
                        .padding(.top, 24)
                        
                        
                        // MARK: 2. ALL COMMUNITIES SECTION
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Text("All Communities")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(Color.color)
                                
                                Spacer()
                                
                                Button {
                                    showAllCommunitiesSheet = true
                                } label: {
                                    Text("See all")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundStyle(.orange)
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            VStack(spacing: 12) {
                                ForEach(filteredCommunities) { community in
                                    Button {
                                        if authManager.requireAuth(for: "community group discussions") {
                                            selectedCommunity = community
                                        }
                                    } label: {
                                        CommunityRow(community: community)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        Spacer(minLength: 80)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 36,
                            topTrailingRadius: 36
                        )
                    )
                }
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $authManager.showAuthModal) {
            AuthRequiredModalSheet()
        }
        .sheet(isPresented: $showCreateSheet) {
            CreateCommunitySheet()
        }
        .sheet(isPresented: $showAllCommunitiesSheet) {
            AllCommunitiesSheet(communities: allCommunities)
        }
        .navigationDestination(item: $selectedCommunity) { comm in
            CommunityDetailGroupView(community: comm)
        }
    }
}


// MARK: - DATA MODEL

struct CommunityModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let category: String
    let isAnnouncement: Bool
    let time: String
    let unreadCount: Int
    let isPinned: Bool
    let hasShareBadge: Bool
    let iconName: String
}


// MARK: - MY COMMUNITY CARD

struct MyCommunityCard: View {
    let community: CommunityModel
    
    var body: some View {
        VStack(spacing: 10) {
            Image(community.iconName)
                .resizable()
                .scaledToFill()
                .frame(width: 58, height: 58)
                .clipShape(Circle())
                .padding(.top, 12)
            
            VStack(spacing: 3) {
                Text(community.title)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(Color.color)
                    .lineLimit(1)
                
                Text(community.category)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(community.isAnnouncement ? Color.red : Color.gray)
                    .lineLimit(1)
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 12)
        }
        .frame(width: 125, height: 145)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Color.gray.opacity(0.15), lineWidth: 1)
        )
    }
}


// MARK: - ADD COMMUNITY PLUS CARD (END OF MY COMMUNITIES SCROLLVIEW)

struct AddCommunityCard: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color.orange.opacity(0.12))
                        .frame(width: 54, height: 54)
                    
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.orange)
                }
                
                Text("Create")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(Color.color)
            }
            .frame(width: 125, height: 145)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .shadow(color: .black.opacity(0.06), radius: 5, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .stroke(Color.orange.opacity(0.4), lineWidth: 1.5)
            )
        }
        .buttonStyle(.plain)
    }
}


// MARK: - COMMUNITY ROW ITEM (WITH LITTLE PLUS / CHECKMARK JOIN TOGGLE)

struct CommunityRow: View {
    let community: CommunityModel
    @State private var isJoined: Bool = false
    @ObservedObject var authManager = UserAuthManager.shared
    
    var body: some View {
        HStack(spacing: 14) {
            ZStack(alignment: .bottomTrailing) {
                Image(community.iconName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(community.title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.color)
                    .lineLimit(1)
                
                Text(community.category)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(community.isAnnouncement ? Color.red : Color.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 6) {
                Text(community.time)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(.gray)
                
                HStack(spacing: 8) {
                    // LITTLE PLUS BUTTON / CHECKMARK TOGGLE TO JOIN COMMUNITY (PROTECTED FOR GUEST MODE)
                    Button {
                        if authManager.requireAuth(for: "joining communities") {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.65)) {
                                isJoined.toggle()
                            }
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(isJoined ? Color.green : Color.orange)
                                .frame(width: 22, height: 22)
                                .shadow(color: .black.opacity(0.12), radius: 2, y: 1)
                            
                            Image(systemName: isJoined ? "checkmark" : "plus")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundStyle(.white)
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding(14)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.06), radius: 5, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(isJoined ? Color.green.opacity(0.3) : Color.gray.opacity(0.15), lineWidth: isJoined ? 1.5 : 1)
        )
    }
}


// MARK: - COMMUNITY DETAIL GROUP VIEW

struct CommunityDetailGroupView: View {
    let community: CommunityModel
    @State private var messageInput = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(community.iconName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(community.title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.color)
                    Text(community.category)
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .shadow(color: .black.opacity(0.05), radius: 3, y: 2)
            
            ScrollView {
                VStack(spacing: 14) {
                    Text("Welcome to \(community.title)!")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.gray)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Capsule())
                        .padding(.top, 16)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Admin")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(Color.orange)
                            Text("Welcome everyone! Please feel free to share announcements and discussion topics here.")
                                .font(.system(size: 14))
                        }
                        .padding(14)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .background(Color.gray.opacity(0.05))
            
            HStack(spacing: 12) {
                TextField("Message \(community.title)...", text: $messageInput)
                    .padding(.horizontal, 16)
                    .frame(height: 44)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                
                Button {
                    messageInput = ""
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(Color.orange)
                        .clipShape(Circle())
                }
            }
            .padding()
            .background(Color.white)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
}


// MARK: - ALL COMMUNITIES SHEET (SEE ALL DESTINATION)

struct AllCommunitiesSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""
    let communities: [CommunityModel]
    
    var filtered: [CommunityModel] {
        if searchText.isEmpty { return communities }
        return communities.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.category.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 14) {
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    TextField("Search communities...", text: $searchText)
                        .font(.system(size: 14))
                }
                .padding(12)
                .background(Color.gray.opacity(0.08))
                .clipShape(Capsule())
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(filtered) { community in
                            NavigationLink {
                                CommunityDetailGroupView(community: community)
                            } label: {
                                CommunityRow(community: community)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(16)
                }
            }
            .navigationTitle("All Communities")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}


// MARK: - CREATE COMMUNITY SHEET

struct CreateCommunitySheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var communityName = ""
    @State private var communityType = "Academic"
    @State private var description = ""
    
    let types = ["Academic", "Announcement", "General Discussion", "Sports", "Clubs"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Community Info") {
                    TextField("Community Name", text: $communityName)
                    Picker("Category", selection: $communityType) {
                        ForEach(types, id: \.self) { type in
                            Text(type)
                        }
                    }
                }
                
                Section("Description") {
                    TextEditor(text: $description)
                        .frame(height: 80)
                }
            }
            .navigationTitle("Create Community")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Create") { dismiss() }
                        .fontWeight(.bold)
                        .foregroundStyle(Color.orange)
                }
            }
        }
    }
}

#Preview {
    CommunityView()
}
