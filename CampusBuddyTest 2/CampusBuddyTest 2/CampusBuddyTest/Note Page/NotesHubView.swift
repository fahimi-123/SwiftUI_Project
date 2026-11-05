//
//  NotesHubView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 10/08/2026.
//

import SwiftUI

struct NoteModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subject: String
    let author: String
    let authorImage: String
    let time: String
    let views: String
    let imageName: String
}

struct NotesHubView: View {
    
    @ObservedObject var authManager = UserAuthManager.shared
    @State private var searchText = ""
    @State private var selectedSubjectFilter = "All"
    
    @State private var selectedNote: NoteModel? = nil
    @State private var showUploadView = false
    
    let subjects = ["All", "Computer Science", "Mathematics", "Physics", "Chemistry", "Biology"]
    
    let sampleNotes = [
        NoteModel(
            title: "Numerical Methods in Computer Science",
            subject: "Computer Science",
            author: "Faris Danial",
            authorImage: "RosesFarhan",
            time: "2 days ago",
            views: "1.4k",
            imageName: "computer"
        ),
        NoteModel(
            title: "Fundamentals of Software Engineering",
            subject: "Computer Science",
            author: "Farah Nabilah",
            authorImage: "Farah",
            time: "3 days ago",
            views: "980",
            imageName: "fundamental"
        ),
        NoteModel(
            title: "Java Programming & OOP Masterclass",
            subject: "Computer Science",
            author: "Naz",
            authorImage: "Naz",
            time: "1 week ago",
            views: "2.1k",
            imageName: "Java"
        ),
        NoteModel(
            title: "General Science & Physics Principles",
            subject: "Physics",
            author: "Syakir",
            authorImage: "Syakir",
            time: "4 days ago",
            views: "720",
            imageName: "Science"
        )
    ]
    
    var filteredNotes: [NoteModel] {
        sampleNotes.filter { note in
            let matchesSearch = searchText.isEmpty ||
            note.title.localizedCaseInsensitiveContains(searchText) ||
            note.subject.localizedCaseInsensitiveContains(searchText)
            
            let matchesSubject = selectedSubjectFilter == "All" || note.subject == selectedSubjectFilter
            
            return matchesSearch && matchesSubject
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
                    
                    
                    // MARK: - NOTES HUB TITLE & SUBTITLE
                    VStack(alignment: .leading, spacing: 14) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Notes Hub")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Text("Find and share top-rated lecture notes & study materials.")
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
                            
                            TextField("Search subject, code or title....", text: $searchText)
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
                    
                    
                    // MARK: - WHITE CONTENT SECTION (CURVED TOP SHAPE VISIBLE OVER BLUE)
                    VStack(spacing: 20) {
                        
                        // Subject Category Filters
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(subjects, id: \.self) { subject in
                                    Button {
                                        selectedSubjectFilter = subject
                                    } label: {
                                        Text(subject)
                                            .font(.system(size: 13, weight: .semibold))
                                            .foregroundStyle(selectedSubjectFilter == subject ? .white : Color.color)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(selectedSubjectFilter == subject ? Color.color : Color.gray.opacity(0.08))
                                            .clipShape(Capsule())
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 24)
                        }
                        
                        // Section Header + 3 notes + PLUS BUTTON BESIDE IT
                        HStack(alignment: .center) {
                            Text(searchText.isEmpty ? "All Notes" : "Search Results")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            Spacer()
                            
                            HStack(spacing: 8) {
                                Text("\(filteredNotes.count) notes")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundStyle(.orange)
                                
                                Button {
                                    if authManager.requireAuth(for: "uploading study notes") {
                                        showUploadView = true
                                    }
                                } label: {
                                    Image(systemName: "plus")
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundStyle(.white)
                                        .frame(width: 26, height: 26)
                                        .background(Color.orange)
                                        .clipShape(Circle())
                                        .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // Notes List (Protected for Guest Mode)
                        VStack(spacing: 14) {
                            ForEach(filteredNotes, id: \.title) { note in
                                Button {
                                    if authManager.requireAuth(for: "study notes & downloads") {
                                        selectedNote = note
                                    }
                                } label: {
                                    HStack(spacing: 14) {
                                        Image(note.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 70, height: 82)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
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
                                                
                                                Text("By \(note.author) • \(note.time)")
                                                    .font(.system(size: 12.5))
                                                    .foregroundStyle(.gray)
                                            }
                                            
                                            HStack(spacing: 12) {
                                                Label(note.views, systemImage: "eye.fill")
                                                    .font(.system(size: 11, weight: .medium))
                                                    .foregroundStyle(.orange)
                                                
                                                Text(note.subject)
                                                    .font(.system(size: 10, weight: .bold))
                                                    .foregroundStyle(Color.color)
                                                    .padding(.horizontal, 8)
                                                    .padding(.vertical, 3)
                                                    .background(Color.gray.opacity(0.1))
                                                    .clipShape(Capsule())
                                            }
                                            .padding(.top, 2)
                                        }
                                        
                                        Spacer(minLength: 0)
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundStyle(.gray)
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
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        
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
        .navigationDestination(isPresented: $showUploadView) {
            UploadNotesView()
        }
        .navigationDestination(item: $selectedNote) { note in
            NoteDetailView(
                title: note.title,
                subject: note.subject,
                author: note.author,
                authorImage: note.authorImage,
                time: note.time,
                views: note.views,
                description: "Comprehensive lecture notes and solved practice questions for student revision.",
                university: "UPSI",
                noteType: "Lecture Notes",
                noteImage: note.imageName,
                previewImages: [note.imageName, note.imageName]
            )
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("PopToHomeRoot"))) { _ in
            showUploadView = false
        }
    }
}

#Preview {
    NotesHubView()
}
