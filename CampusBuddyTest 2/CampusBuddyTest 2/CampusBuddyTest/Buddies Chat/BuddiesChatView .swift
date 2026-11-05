//
//  BuddiesChatView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 13/08/2026.
//

import SwiftUI

struct BuddiesChatView: View {
    
    @ObservedObject var authManager = UserAuthManager.shared
    @State private var searchText = ""
    @State private var showAllFeaturedBuddiesSheet = false
    @State private var showAllBuddyRequestsSheet = false
    
    @State private var selectedChatBuddy: String? = nil
    @State private var selectedChatImage: String = "KimiPhoto"
    @State private var navigateToChat = false
    
    @State private var buddyRequests = [
        BuddyRequestModel(name: "Hana Humaira", university: "UiTM Shah Alam", note: "Wants to study Data Structures together", imageName: "userHana"),
        BuddyRequestModel(name: "Fahimi Imran", university: "UPSI Main Campus", note: "Wants to learn about AutoCAD & Design", imageName: "userFahimi")
    ]
    
    let featuredBuddies = [
        FeatureBuddyModel(name: "Nadia Sofea", university: "UPSI", tag: "Mathematics", note: "Happy to help with Calculus & Linear Algebra!", imageName: "userNad"),
        FeatureBuddyModel(name: "Fahimi Imran", university: "UPSI", tag: "Computer Science", note: "Free for Java coding & assignment study!", imageName: "userFahimi"),
        FeatureBuddyModel(name: "Firdaus Hakimi", university: "UiTM Puncak Alam", tag: "Business", note: "Happy to help with Finance & Marketing", imageName: "userFir"),
        FeatureBuddyModel(name: "Hana Humaira", university: "UM", tag: "C++ Programming", note: "Free for weekend study sessions!", imageName: "userHana")
    ]
    
    let activeBuddies = [
        Buddy(name: "Hana Humaira", message: "Hey! Dah siap assignment Data Structure?", imageName: "userHana"),
        Buddy(name: "Fahimi Imran", message: "Jom study together petang ni dekat library?", imageName: "userFahimi"),
        Buddy(name: "Nadia Sofea", message: "I found some super useful notes for Calculus!", imageName: "userNad"),
        Buddy(name: "Firdaus Hakimi", message: "Can you review my UI design prototype?", imageName: "userFir")
    ]
    
    var filteredBuddies: [Buddy] {
        if searchText.isEmpty {
            return activeBuddies
        }
        return activeBuddies.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.message.localizedCaseInsensitiveContains(searchText)
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
                    
                    
                    // MARK: - BUDDY HUB TITLE BLOCK (MESSAGE ICON REMOVED)
                    VStack(alignment: .leading, spacing: 14) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Buddy Hub")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Text("Connect, collaborate and help each other on campus.")
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
                            
                            TextField("Search buddies, skills, or interests....", text: $searchText)
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
                        
                        // MARK: 1. FEATURED BUDDIES SECTION
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Text("Featured Buddies")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(Color.color)
                                
                                Spacer()
                                
                                Button {
                                    showAllFeaturedBuddiesSheet = true
                                } label: {
                                    Text("See all")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundStyle(.orange)
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 14) {
                                    ForEach(featuredBuddies) { buddy in
                                        Button {
                                            if authManager.requireAuth(for: "buddy profiles & chat") {
                                                selectedChatBuddy = buddy.name
                                                selectedChatImage = buddy.imageName
                                                navigateToChat = true
                                            }
                                        } label: {
                                            FeaturedBuddyCard(buddy: buddy)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 4)
                            }
                        }
                        .padding(.top, 24)
                        
                        
                        // MARK: 2. BUDDY REQUESTS SECTION
                        if !buddyRequests.isEmpty {
                            VStack(alignment: .leading, spacing: 14) {
                                HStack(spacing: 8) {
                                    Text("Buddy Requests")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundStyle(Color.color)
                                    
                                    // Count Badge
                                    Text("\(buddyRequests.count)")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundStyle(.white)
                                        .frame(width: 20, height: 20)
                                        .background(Color.orange)
                                        .clipShape(Circle())
                                    
                                    Spacer()
                                    
                                    Button {
                                        showAllBuddyRequestsSheet = true
                                    } label: {
                                        Text("See all")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundStyle(.orange)
                                    }
                                }
                                .padding(.horizontal, 20)
                                
                                VStack(spacing: 12) {
                                    ForEach(buddyRequests) { request in
                                        BuddyRequestRow(
                                            request: request,
                                            onAccept: {
                                                if authManager.requireAuth(for: "buddy requests") {
                                                    withAnimation {
                                                        buddyRequests.removeAll { $0.id == request.id }
                                                    }
                                                }
                                            },
                                            onDecline: {
                                                if authManager.requireAuth(for: "buddy requests") {
                                                    withAnimation {
                                                        buddyRequests.removeAll { $0.id == request.id }
                                                    }
                                                }
                                            }
                                        )
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                        }
                        
                        
                        // MARK: 3. MY BUDDIES CHAT LIST SECTION
                        VStack(alignment: .leading, spacing: 14) {
                            HStack {
                                Text(searchText.isEmpty ? "My Buddies" : "Search Results")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(Color.color)
                                
                                Spacer()
                                
                                Text("\(filteredBuddies.count) buddies")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundStyle(.orange)
                            }
                            .padding(.horizontal, 20)
                            
                            VStack(spacing: 12) {
                                ForEach(filteredBuddies) { buddy in
                                    Button {
                                        if authManager.requireAuth(for: "messaging buddies") {
                                            selectedChatBuddy = buddy.name
                                            selectedChatImage = buddy.imageName
                                            navigateToChat = true
                                        }
                                    } label: {
                                        BuddyRow(buddy: buddy)
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
        .sheet(isPresented: $showAllFeaturedBuddiesSheet) {
            AllFeaturedBuddiesSheet(buddies: featuredBuddies)
        }
        .sheet(isPresented: $showAllBuddyRequestsSheet) {
            AllBuddyRequestsSheet(requests: $buddyRequests)
        }
        .navigationDestination(isPresented: $navigateToChat) {
            ChatDetailView(
                buddyName: selectedChatBuddy ?? "Buddy",
                imageName: selectedChatImage
            )
        }
    }
}


// MARK: - DATA MODELS

struct FeatureBuddyModel: Identifiable {
    let id = UUID()
    let name: String
    let university: String
    let tag: String
    let note: String
    let imageName: String
}

struct BuddyRequestModel: Identifiable {
    let id = UUID()
    let name: String
    let university: String
    let note: String
    let imageName: String
}

struct Buddy: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let imageName: String
}


// MARK: - FEATURED BUDDY CARD (WITH PLUS TO CHECKMARK TOGGLE)

struct FeaturedBuddyCard: View {
    let buddy: FeatureBuddyModel
    @State private var isFollowing: Bool = false
    @ObservedObject var authManager = UserAuthManager.shared
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                Image(buddy.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 2)
                    )
                
                // PLUS ICON BADGE -> TOGGLES TO CHECKMARK TICK ON TAP (PROTECTED FOR GUEST MODE)
                Button {
                    if authManager.requireAuth(for: "following buddies") {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.65)) {
                            isFollowing.toggle()
                        }
                    }
                } label: {
                    ZStack {
                        Circle()
                            .fill(isFollowing ? Color.green : Color(red: 0.1, green: 0.5, blue: 0.95))
                            .frame(width: 24, height: 24)
                            .shadow(color: .black.opacity(0.15), radius: 3, y: 1)
                        
                        Image(systemName: isFollowing ? "checkmark" : "plus")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(.white)
                    }
                }
                .buttonStyle(.plain)
                .offset(x: 2, y: 2)
            }
            .padding(.top, 14)
            
            VStack(spacing: 2) {
                Text(buddy.name)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color.color)
                    .lineLimit(1)
                
                Text(buddy.university)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(.gray)
                
                Text(buddy.tag)
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.orange)
                    .clipShape(Capsule())
                    .padding(.top, 4)
                
                Text(buddy.note)
                    .font(.system(size: 10.5, weight: .regular))
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.horizontal, 8)
                    .padding(.top, 2)
            }
            .padding(.bottom, 12)
        }
        .frame(width: 125, height: 190)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(isFollowing ? Color.green.opacity(0.4) : Color.gray.opacity(0.15), lineWidth: isFollowing ? 1.5 : 1)
        )
    }
}


// MARK: - BUDDY REQUEST ROW

struct BuddyRequestRow: View {
    let request: BuddyRequestModel
    var onAccept: () -> Void
    var onDecline: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Image(request.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 54, height: 54)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3) {
                Text(request.name)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.color)
                
                Text(request.university)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.gray)
                
                Text(request.note)
                    .font(.system(size: 12))
                    .foregroundStyle(.gray.opacity(0.9))
                    .lineLimit(1)
            }
            
            Spacer(minLength: 0)
            
            VStack(spacing: 6) {
                Button {
                    onDecline()
                } label: {
                    Text("Decline")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.gray)
                        .frame(width: 76, height: 26)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                }
                
                Button {
                    onAccept()
                } label: {
                    ZStack(alignment: .trailing) {
                        Text("Accept")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 76, height: 26)
                            .background(Color.orange)
                            .clipShape(Capsule())
                        
                        ZStack {
                            Circle()
                                .fill(Color(red: 0.1, green: 0.5, blue: 0.95))
                                .frame(width: 18, height: 18)
                            
                            Image(systemName: "arrow.up.right")
                                .font(.system(size: 9, weight: .bold))
                                .foregroundStyle(.white)
                        }
                        .offset(x: 4, y: -6)
                    }
                }
            }
        }
        .padding(12)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: .black.opacity(0.06), radius: 5, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.gray.opacity(0.15), lineWidth: 1)
        )
    }
}


// MARK: - BUDDY ROW CARD

struct BuddyRow: View {
    let buddy: Buddy
    
    var body: some View {
        HStack(spacing: 14) {
            Image(buddy.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 54, height: 54)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(buddy.name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Color.color)
                
                Text(buddy.message)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.gray)
        }
        .padding(14)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: .black.opacity(0.06), radius: 5, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.gray.opacity(0.15), lineWidth: 1)
        )
    }
}


// MARK: - ALL FEATURED BUDDIES SHEET (SEE ALL DESTINATION)

struct AllFeaturedBuddiesSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""
    let buddies: [FeatureBuddyModel]
    
    var filtered: [FeatureBuddyModel] {
        if searchText.isEmpty { return buddies }
        return buddies.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.tag.localizedCaseInsensitiveContains(searchText) ||
            $0.university.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 14),
        GridItem(.flexible(), spacing: 14)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 14) {
                // Search Input
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    TextField("Search featured buddies...", text: $searchText)
                        .font(.system(size: 14))
                }
                .padding(12)
                .background(Color.gray.opacity(0.08))
                .clipShape(Capsule())
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(filtered) { buddy in
                            FeaturedBuddyCard(buddy: buddy)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Featured Buddies")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}


// MARK: - ALL BUDDY REQUESTS SHEET (SEE ALL DESTINATION)

struct AllBuddyRequestsSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var requests: [BuddyRequestModel]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    if requests.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "person.crop.circle.badge.checkmark")
                                .font(.system(size: 48))
                                .foregroundStyle(.gray)
                            Text("No Pending Requests")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(Color.color)
                        }
                        .padding(.top, 60)
                    } else {
                        ForEach(requests) { request in
                            BuddyRequestRow(
                                request: request,
                                onAccept: {
                                    withAnimation {
                                        requests.removeAll { $0.id == request.id }
                                    }
                                },
                                onDecline: {
                                    withAnimation {
                                        requests.removeAll { $0.id == request.id }
                                    }
                                }
                            )
                        }
                    }
                }
                .padding(16)
            }
            .navigationTitle("Buddy Requests (\(requests.count))")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}


#Preview {
    BuddiesChatView()
}
