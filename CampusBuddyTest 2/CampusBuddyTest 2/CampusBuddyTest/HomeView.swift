//
//  HomeView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 13/08/2026.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authManager = UserAuthManager.shared
    @State private var showSignUpSheet = false
    @State private var navigateToProfile = false
    
    // Protected Navigation States for Guest Mode
    @State private var selectedBuddy: BuddyItem? = nil
    @State private var selectedNote: NoteItem? = nil
    @State private var selectedMarketItem: MarketItem? = nil
    
    let recommendedBuddies = [
        BuddyItem(name: "Firdaus Hakimi", skill: "Java, Python", imageName: "userFir"),
        BuddyItem(name: "Hana Humaira", skill: "Calculus & Linear Algebra", imageName: "userHana"),
        BuddyItem(name: "Nadia Sofea", skill: "UI/UX & Figma Design", imageName: "userNad"),
        BuddyItem(name: "Fahimi Imran", skill: "C++ & Data Structures", imageName: "userFahimi"),
        BuddyItem(name: "Siti Sarah", skill: "Physics & Chemistry", imageName: "userHana")
    ]
    
    let popularNotes = [
        NoteItem(
            title: "Numerical Methods in Computer Science",
            university: "UPSI",
            pages: 14,
            imageName: "computer",
            author: "Faris Danial",
            authorImage: "RosesFarhan",
            views: "1.4k"
        ),
        NoteItem(
            title: "Fundamentals of Software Engineering",
            university: "UPSI",
            pages: 42,
            imageName: "fundamental",
            author: "Farah Nabilah",
            authorImage: "Farah",
            views: "980"
        ),
        NoteItem(
            title: "Java Programming & OOP Masterclass",
            university: "UPSI",
            pages: 35,
            imageName: "Java",
            author: "Naz",
            authorImage: "Naz",
            views: "1.1k"
        ),
        NoteItem(
            title: "General Science & Physics Principles",
            university: "UPSI",
            pages: 28,
            imageName: "Science",
            author: "Syakir",
            authorImage: "Syakir",
            views: "850"
        )
    ]
    
    let marketplaceItems = [
        MarketItem(
            title: "Casio Scientific Calculator FX-570EX",
            price: "RM45",
            imageName: "Calculator",
            location: "Kolej Harun Aminurrashid",
            sellerName: "Naz",
            sellerImage: "Naz"
        ),
        MarketItem(
            title: "Engineering Mathematics Textbook (3rd Ed)",
            price: "RM25",
            imageName: "Note1",
            location: "KSAS Main Library",
            sellerName: "Syakir",
            sellerImage: "Syakir"
        ),
        MarketItem(
            title: "Lab Coat Size M (Clean Condition)",
            price: "RM18",
            imageName: "Lab Coat",
            location: "Kolej Za'ba",
            sellerName: "Farah",
            sellerImage: "Farah"
        )
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            // Split Background: Blue top for header curve visibility + White bottom for clean tab bar
            VStack(spacing: 0) {
                Color.color
                    .frame(height: 320)
                Color.white
            }
            .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    // MARK: - TOP HEADER (Centered CampusBuddy Logo)
                    VStack(spacing: 0) {
                        
                        // Centered App Logo Title
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
                        
                        
                        // MARK: - WELCOME USER ROW (Guest -> Tapping opens Sign Up / Login)
                        HStack(spacing: 14) {
                            Button {
                                if authManager.isLoggedIn {
                                    navigateToProfile = true
                                } else {
                                    authManager.showSignUpSheet = true
                                }
                            } label: {
                                ZStack(alignment: .bottomTrailing) {
                                    if authManager.isLoggedIn {
                                        Image(authManager.userPhoto)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 52, height: 52)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.white, lineWidth: 2.5))
                                            .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
                                    } else {
                                        ZStack {
                                            Circle()
                                                .fill(Color.white.opacity(0.25))
                                                .frame(width: 52, height: 52)
                                            
                                            Image(systemName: "person.fill")
                                                .font(.system(size: 26))
                                                .foregroundStyle(.white)
                                        }
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2.5))
                                        .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
                                        
                                        // Orange Plus Badge for Guest
                                        ZStack {
                                            Circle()
                                                .fill(Color.orange)
                                                .frame(width: 18, height: 18)
                                            Image(systemName: "plus")
                                                .font(.system(size: 10, weight: .bold))
                                                .foregroundStyle(.white)
                                        }
                                        .offset(x: 2, y: 2)
                                    }
                                }
                            }
                            .buttonStyle(.plain)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(authManager.isLoggedIn ? "Hi \(authManager.userName)" : "Hi Guest")
                                    .font(.system(size: 14, weight: .regular))
                                    .foregroundStyle(.white.opacity(0.9))
                                
                                Text(authManager.isLoggedIn ? "Welcome Back!" : "Tap to Sign Up / Log In")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundStyle(.white)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 24)
                    }
                    
                    
                    // MARK: - WHITE CONTENT SECTION (CURVED TOP SHAPE VISIBLE OVER BLUE)
                    VStack(spacing: 24) {
                        
                        // Recommended Buddies Section
                        VStack(alignment: .leading, spacing: 14) {
                            SectionHeader(title: "Recommended Buddies", feature: "recommended buddies list") {
                                SeeAllBuddiesListView(buddies: recommendedBuddies)
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 14) {
                                    ForEach(recommendedBuddies) { buddy in
                                        Button {
                                            if authManager.requireAuth(for: "buddy chat & profiles") {
                                                selectedBuddy = buddy
                                            }
                                        } label: {
                                            BuddyCardView(buddy: buddy)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 4)
                            }
                        }
                        .padding(.top, 24)
                        
                        
                        // Popular Notes Section
                        VStack(alignment: .leading, spacing: 14) {
                            SectionHeader(title: "Popular Notes", feature: "popular study notes list") {
                                SeeAllNotesListView(notes: popularNotes)
                            }
                            
                            VStack(spacing: 12) {
                                ForEach(popularNotes) { note in
                                    Button {
                                        if authManager.requireAuth(for: "popular study notes") {
                                            selectedNote = note
                                        }
                                    } label: {
                                        PopularNoteRow(note: note)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                        
                        
                        // Latest Marketplace Section
                        VStack(alignment: .leading, spacing: 14) {
                            SectionHeader(title: "Latest in Marketplace", feature: "marketplace items list") {
                                SeeAllMarketplaceListView(items: marketplaceItems)
                            }
                            
                            VStack(spacing: 12) {
                                ForEach(marketplaceItems) { item in
                                    Button {
                                        if authManager.requireAuth(for: "marketplace items") {
                                            selectedMarketItem = item
                                        }
                                    } label: {
                                        MarketplaceRow(item: item)
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
        .sheet(isPresented: $authManager.showSignUpSheet) {
            SignUpView()
        }
        .sheet(isPresented: $authManager.showLoginSheet) {
            LoginView()
        }
        .sheet(isPresented: $authManager.showAuthModal) {
            AuthRequiredModalSheet()
        }
        .navigationDestination(isPresented: $navigateToProfile) {
            ProfileView()
        }
        .navigationDestination(item: $selectedBuddy) { buddy in
            ChatDetailView(buddyName: buddy.name, imageName: buddy.imageName)
        }
        .navigationDestination(item: $selectedNote) { note in
            NoteDetailView(
                title: note.title,
                subject: "Computer Science",
                author: note.author,
                authorImage: note.authorImage,
                time: "2 days ago",
                views: note.views,
                description: "Comprehensive lecture notes and solved practice questions for student revision.",
                university: note.university,
                noteType: "Lecture Notes",
                noteImage: note.imageName,
                previewImages: [note.imageName, note.imageName]
            )
        }
        .navigationDestination(item: $selectedMarketItem) { item in
            ProductDetailView(
                imageName: item.imageName,
                title: item.title,
                price: item.price,
                location: item.location,
                sellerName: item.sellerName,
                sellerImage: item.sellerImage
            )
        }
    }
}


// MARK: - DATA MODELS

struct BuddyItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let skill: String
    let imageName: String
}

struct NoteItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let university: String
    let pages: Int
    let imageName: String
    let author: String
    var authorImage: String = "RosesFarhan"
    let views: String
}

struct MarketItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let price: String
    let imageName: String
    let location: String
    var sellerName: String = "Naz"
    var sellerImage: String = "Naz"
}


// MARK: - SECTION HEADER COMPONENT

struct SectionHeader<Destination: View>: View {
    let title: String
    let feature: String
    let destination: () -> Destination
    @ObservedObject var authManager = UserAuthManager.shared
    @State private var navigate: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.color)
            
            Spacer()
            
            Button {
                if authManager.requireAuth(for: feature) {
                    navigate = true
                }
            } label: {
                Text("See all")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(Color.orange)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 20)
        .navigationDestination(isPresented: $navigate) {
            destination()
        }
    }
}


// MARK: - BUDDY CARD VIEW

struct BuddyCardView: View {
    let buddy: BuddyItem
    
    var body: some View {
        VStack(spacing: 8) {
            Image(buddy.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 62, height: 62)
                .clipShape(Circle())
                .padding(.top, 10)
            
            VStack(spacing: 3) {
                Text(buddy.name)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(Color.color)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
                
                Text(buddy.skill)
                    .font(.system(size: 10.5, weight: .medium))
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 10)
        }
        .frame(width: 115, height: 135)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.gray.opacity(0.18), lineWidth: 1)
        )
    }
}


// MARK: - POPULAR NOTE ROW CARD

struct PopularNoteRow: View {
    let note: NoteItem
    
    var body: some View {
        HStack(spacing: 16) {
            Image(note.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 85, height: 95)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(note.title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.color)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 5) {
                    Image(note.authorImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 16)
                        .clipShape(Circle())
                    
                    Text("\(note.author) • \(note.university)")
                        .font(.system(size: 12.5, weight: .regular))
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(14)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
    }
}


// MARK: - MARKETPLACE ROW CARD

struct MarketplaceRow: View {
    let item: MarketItem
    
    var body: some View {
        HStack(spacing: 16) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 85, height: 85)
                .background(Color.gray.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.color)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(item.price)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Color.orange)
                
                HStack(spacing: 6) {
                    Image(item.sellerImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 18, height: 18)
                        .clipShape(Circle())
                    
                    Text(item.sellerName)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(14)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
    }
}


// MARK: - SEE ALL BUDDIES LIST VIEW

struct SeeAllBuddiesListView: View {
    let buddies: [BuddyItem]
    @State private var searchText = ""
    @State private var selectedBuddy: BuddyItem? = nil
    
    var filteredBuddies: [BuddyItem] {
        if searchText.isEmpty { return buddies }
        return buddies.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.skill.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search buddies by name or skill...", text: $searchText)
                    .font(.system(size: 14))
            }
            .padding(12)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.05), radius: 4)
            .padding(.horizontal, 16)
            .padding(.top, 10)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(filteredBuddies) { buddy in
                        Button {
                            selectedBuddy = buddy
                        } label: {
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
                                    Text(buddy.skill)
                                        .font(.system(size: 13))
                                        .foregroundStyle(.gray)
                                }
                                
                                Spacer()
                                
                                HStack(spacing: 6) {
                                    Image(systemName: "message.fill")
                                        .font(.system(size: 12))
                                    Text("Chat")
                                        .font(.system(size: 13, weight: .bold))
                                }
                                .foregroundStyle(.white)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(Color.orange)
                                .clipShape(Capsule())
                            }
                            .padding(14)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .shadow(color: .black.opacity(0.05), radius: 4)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(16)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Recommended Buddies")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .navigationDestination(item: $selectedBuddy) { buddy in
            ChatDetailView(buddyName: buddy.name, imageName: buddy.imageName)
        }
    }
}


// MARK: - SEE ALL NOTES LIST VIEW

struct SeeAllNotesListView: View {
    let notes: [NoteItem]
    @State private var searchText = ""
    @State private var selectedNote: NoteItem? = nil
    
    var filteredNotes: [NoteItem] {
        if searchText.isEmpty { return notes }
        return notes.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.university.localizedCaseInsensitiveContains(searchText) ||
            $0.author.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search notes by title or author...", text: $searchText)
                    .font(.system(size: 14))
            }
            .padding(12)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.05), radius: 4)
            .padding(.horizontal, 16)
            .padding(.top, 10)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(filteredNotes) { note in
                        Button {
                            selectedNote = note
                        } label: {
                            PopularNoteRow(note: note)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(16)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Popular Notes")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .navigationDestination(item: $selectedNote) { note in
            NoteDetailView(
                title: note.title,
                subject: "Computer Science",
                author: note.author,
                authorImage: note.authorImage,
                time: "2 days ago",
                views: note.views,
                description: "Comprehensive lecture notes and solved practice questions for student revision.",
                university: note.university,
                noteType: "Lecture Notes",
                noteImage: note.imageName,
                previewImages: [note.imageName, note.imageName]
            )
        }
    }
}


// MARK: - SEE ALL MARKETPLACE LIST VIEW

struct SeeAllMarketplaceListView: View {
    let items: [MarketItem]
    @State private var searchText = ""
    @State private var selectedItem: MarketItem? = nil
    
    var filteredItems: [MarketItem] {
        if searchText.isEmpty { return items }
        return items.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.location.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search items or locations...", text: $searchText)
                    .font(.system(size: 14))
            }
            .padding(12)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.05), radius: 4)
            .padding(.horizontal, 16)
            .padding(.top, 10)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(filteredItems) { item in
                        Button {
                            selectedItem = item
                        } label: {
                            MarketplaceRow(item: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(16)
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Latest in Marketplace")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .navigationDestination(item: $selectedItem) { item in
            ProductDetailView(
                imageName: item.imageName,
                title: item.title,
                price: item.price,
                location: item.location,
                sellerName: item.sellerName,
                sellerImage: item.sellerImage
            )
        }
    }
}


#Preview {
    HomeView()
}
