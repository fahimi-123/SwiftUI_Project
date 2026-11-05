//
//  ProfileView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 13/08/2026.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - USER STATE
    @State private var userName: String = "SYAKIR ZUFAIRIN"
    @State private var userEmail: String = "d20241110000@siswa.upsi.edu.my"
    @State private var userMatric: String = "D20241110000"
    @State private var userCourse: String = "Bachelor in Software Engineering"
    @State private var userCampus: String = "UPSI"
    @State private var profileCompletion: Int = 70
    
    // MARK: - PRESENTATION STATES
    @State private var showEditProfileSheet: Bool = false
    @State private var showNotificationsSheet: Bool = false
    @State private var showPhotoActionSheet: Bool = false
    @State private var selectedPhotosItem: PhotosPickerItem? = nil
    @State private var avatarImage: Image? = nil
    @State private var uiImage: UIImage? = nil
    @State private var showCameraPicker: Bool = false
    @State private var pillMessage: String? = nil
    @State private var showPillAlert: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            // MARK: - SPLIT BACKGROUND: BLUE TOP / WHITE BOTTOM
            VStack(spacing: 0) {
                Color.color
                    .frame(height: 320)
                Color.white
            }
            .ignoresSafeArea()
            
            // MARK: - MAIN SCROLL CONTENT
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    // MARK: - TOP NAVIGATION BAR (Back, Logo, Bell)
                    HStack(alignment: .center) {
                        // Back Button
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 19, weight: .semibold))
                                .foregroundStyle(.white)
                                .frame(width: 44, height: 44, alignment: .leading)
                        }
                        
                        Spacer()
                        
                        // Owl Mascot Logo
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 38)
                        
                        Spacer()
                        
                        // Notification Button
                        Button {
                            showNotificationsSheet = true
                        } label: {
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: "bell.fill")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundStyle(.white)
                                    .frame(width: 44, height: 44, alignment: .trailing)
                                
                                // Notification Badge Red Dot
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 9, height: 9)
                                    .offset(x: -4, y: 8)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    
                    
                    // MARK: - PROFILE AVATAR OVERLAY
                    ZStack(alignment: .bottomTrailing) {
                        Button {
                            showPhotoActionSheet = true
                        } label: {
                            Group {
                                if let avatarImage {
                                    avatarImage
                                        .resizable()
                                        .scaledToFill()
                                } else {
                                    Image("KimiPhoto")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .frame(width: 110, height: 110)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 4)
                            )
                            .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 4)
                        }
                        .buttonStyle(.plain)
                        
                        // Camera Icon Button
                        Button {
                            showPhotoActionSheet = true
                        } label: {
                            Image(systemName: "camera.fill")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(.black)
                                .frame(width: 32, height: 32)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.12), radius: 4, x: 0, y: 2)
                        }
                        .offset(x: 2, y: 2)
                    }
                    .padding(.top, 12)
                    
                    
                    // MARK: - WHITE CARD CONTENT
                    VStack(spacing: 16) {
                        
                        // MARK: USER NAME & EMAIL
                        VStack(spacing: 5) {
                            Text(userName)
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .foregroundStyle(Color.color)
                            
                            Text(userEmail)
                                .font(.system(size: 13, weight: .regular))
                                .foregroundStyle(.gray)
                            
                            // EDIT PROFILE BUTTON
                            Button {
                                showEditProfileSheet = true
                            } label: {
                                Text("Edit Profile")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundStyle(Color.color)
                                    .frame(width: 155, height: 38)
                                    .background(Color.white)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.orange, lineWidth: 1.5)
                                    )
                                    .shadow(color: .black.opacity(0.06), radius: 4, x: 0, y: 2)
                            }
                            .padding(.top, 8)
                        }
                        .padding(.top, 16)
                        
                        
                        // MARK: - THREE BLUE PILLS (Interactive Badges)
                        HStack(spacing: 12) {
                            Button {
                                pillMessage = "Student ID: \(userMatric)"
                                showPillAlert = true
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: "person.text.rectangle")
                                        .font(.system(size: 11))
                                    Text("ID: D2024")
                                        .font(.system(size: 11, weight: .bold))
                                }
                                .foregroundStyle(.white)
                                .frame(width: 85, height: 32)
                                .background(Color.color)
                                .clipShape(Capsule())
                            }
                            
                            Button {
                                pillMessage = "Course: \(userCourse)"
                                showPillAlert = true
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: "graduationcap.fill")
                                        .font(.system(size: 11))
                                    Text("Sem 4")
                                        .font(.system(size: 11, weight: .bold))
                                }
                                .foregroundStyle(.white)
                                .frame(width: 85, height: 32)
                                .background(Color.color)
                                .clipShape(Capsule())
                            }
                            
                            Button {
                                pillMessage = "Campus: \(userCampus)"
                                showPillAlert = true
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: "building.2.fill")
                                        .font(.system(size: 11))
                                    Text("UPSI")
                                        .font(.system(size: 11, weight: .bold))
                                }
                                .foregroundStyle(.white)
                                .frame(width: 85, height: 32)
                                .background(Color.color)
                                .clipShape(Capsule())
                            }
                        }
                        .padding(.vertical, 4)
                        
                        
                        // MARK: - COMPLETE YOUR PROFILE CARD
                        Button {
                            showEditProfileSheet = true
                        } label: {
                            CompleteProfileCard(completionPercent: profileCompletion)
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal, 20)
                        
                        
                        // MARK: - PROFILE MENU OPTIONS
                        ProfileMenu()
                            .padding(.horizontal, 20)
                            .padding(.top, 2)
                        
                        // MARK: - SIGN OUT BUTTON
                        Button {
                            UserAuthManager.shared.logout()
                            dismiss()
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .font(.system(size: 16, weight: .bold))
                                Text("Sign Out")
                                    .font(.system(size: 16, weight: .bold))
                            }
                            .foregroundStyle(Color.red)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.red.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .stroke(Color.red.opacity(0.2), lineWidth: 1)
                            )
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal, 20)
                        .padding(.top, 14)
                        
                        Spacer(minLength: 40)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 36,
                            topTrailingRadius: 36
                        )
                    )
                    .padding(.top, 20)
                }
            }
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showEditProfileSheet) {
            EditProfileView(
                userName: $userName,
                userEmail: $userEmail,
                userMatric: $userMatric,
                userCourse: $userCourse,
                userCampus: $userCampus,
                profileCompletion: $profileCompletion
            )
        }
        .sheet(isPresented: $showNotificationsSheet) {
            NotificationsSheetView()
        }
        .confirmationDialog("Change Profile Photo", isPresented: $showPhotoActionSheet) {
            Button("Take Photo with Camera") {
                showCameraPicker = true
            }
            Button("Cancel", role: .cancel) { }
        }
        .sheet(isPresented: $showCameraPicker) {
            CameraPicker(selectedImage: $uiImage)
                .onChange(of: uiImage) { _, newImg in
                    if let newImg {
                        avatarImage = Image(uiImage: newImg)
                    }
                }
        }
        .alert("Profile Information", isPresented: $showPillAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(pillMessage ?? "")
        }
    }
}


// MARK: - COMPLETE PROFILE CARD

struct CompleteProfileCard: View {
    var completionPercent: Int = 70
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Complete your profile")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.color)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.orange)
            }
            
            Text("Add more details to build trust and connect with buddies!")
                .font(.system(size: 12.5, weight: .regular))
                .foregroundStyle(Color.black.opacity(0.65))
                .fixedSize(horizontal: false, vertical: true)
                .lineSpacing(2)
            
            // Progress Bar
            HStack(spacing: 10) {
                GeometryReader { barGeo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 8)
                        
                        Capsule()
                            .fill(Color.orange)
                            .frame(width: barGeo.size.width * CGFloat(completionPercent) / 100.0, height: 8)
                    }
                }
                .frame(height: 8)
                
                Text("\(completionPercent)%")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.gray)
            }
            .padding(.top, 4)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 14)
        .background(
            Color(red: 0.96, green: 0.86, blue: 0.80)
        )
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}


// MARK: - PROFILE MENU

struct ProfileMenu: View {
    var body: some View {
        VStack(spacing: 0) {
            // 1. My Buddy
            NavigationLink {
                MyBuddyView()
            } label: {
                ProfileMenuRow(
                    icon: "hands.clap.fill",
                    title: "My Buddy"
                )
            }
            .buttonStyle(.plain)
            
            Divider()
                .padding(.leading, 48)
            
            // 2. My Notes
            NavigationLink {
                MyNotesView()
            } label: {
                ProfileMenuRow(
                    icon: "book.closed.fill",
                    title: "My Notes"
                )
            }
            .buttonStyle(.plain)
            
            Divider()
                .padding(.leading, 48)
            
            // 3. My Listing
            NavigationLink {
                MyListingView()
            } label: {
                ProfileMenuRow(
                    icon: "bag.fill",
                    title: "My Listing"
                )
            }
            .buttonStyle(.plain)
            
            Divider()
                .padding(.leading, 48)
            
            // 4. Subscription
            NavigationLink {
                SubscriptionView()
            } label: {
                ProfileMenuRow(
                    icon: "diamond.fill",
                    title: "Subscription",
                    showShare: true
                )
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
        .background(Color.gray.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}


// MARK: - PROFILE MENU ROW

struct ProfileMenuRow: View {
    let icon: String
    let title: String
    var showShare: Bool = false
    
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 19, weight: .medium))
                .foregroundStyle(.black)
                .frame(width: 28, alignment: .center)
            
            Text(title)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(.black)
            
            Spacer()
            
            if showShare {
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.orange)
            } else {
                Image(systemName: "chevron.right")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.orange)
            }
        }
        .frame(height: 52)
    }
}


// MARK: - REDESIGNED EDIT PROFILE VIEW (MATCHING DESIGN BLUEPRINT)

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var userName: String
    @Binding var userEmail: String
    @Binding var userMatric: String
    @Binding var userCourse: String
    @Binding var userCampus: String
    @Binding var profileCompletion: Int
    
    @State private var tempName: String = "SYAKIR ZUFAIRIN"
    @State private var selectedUniversity: String = "UPSI"
    @State private var tempCourse: String = "Bachelor in Software Engineering"
    @State private var bioText: String = ""
    @State private var skillsText: String = ""
    @State private var showCameraPicker: Bool = false
    @State private var uiImage: UIImage? = nil
    @State private var avatarImage: Image? = nil
    
    let universities = ["UPSI", "UM", "UKM", "UTM", "USM", "UiTM", "UUM"]
    
    var body: some View {
        ZStack(alignment: .top) {
            // MARK: - BLUE HEADER BACKGROUND
            Color.color
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    // MARK: - TOP NAVIGATION ROW (Back, Logo, SAVE)
                    HStack(alignment: .center) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: 44, height: 44, alignment: .leading)
                        }
                        
                        Spacer()
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 38)
                        
                        Spacer()
                        
                        Button {
                            userName = tempName
                            userCampus = selectedUniversity
                            userCourse = tempCourse
                            profileCompletion = 100
                            dismiss()
                        } label: {
                            Text("SAVE")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: 55, alignment: .trailing)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    
                    
                    // MARK: - HEADER TITLE
                    Text("Edit Profile")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 6)
                    
                    
                    // MARK: - PROFILE AVATAR WITH CAMERA OVERLAY
                    ZStack(alignment: .bottomTrailing) {
                        Button {
                            showCameraPicker = true
                        } label: {
                            Group {
                                if let avatarImage {
                                    avatarImage
                                        .resizable()
                                        .scaledToFill()
                                } else {
                                    Image("KimiPhoto")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .frame(width: 105, height: 105)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 3.5)
                            )
                            .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
                        }
                        .buttonStyle(.plain)
                        
                        Button {
                            showCameraPicker = true
                        } label: {
                            Image(systemName: "camera.fill")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(.black)
                                .frame(width: 32, height: 32)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.12), radius: 4, x: 0, y: 2)
                        }
                        .offset(x: 2, y: 2)
                    }
                    .padding(.top, 14)
                    
                    
                    // MARK: - WHITE CARD CONTENT CONTAINER
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // 1. Full Name
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Full Name")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            TextField("Full Name", text: $tempName)
                                .font(.system(size: 15, weight: .medium))
                                .padding(.horizontal, 16)
                                .frame(height: 52)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                                )
                        }
                        
                        // 2. University
                        VStack(alignment: .leading, spacing: 8) {
                            Text("University")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            Menu {
                                ForEach(universities, id: \.self) { uni in
                                    Button(uni) {
                                        selectedUniversity = uni
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(selectedUniversity)
                                        .font(.system(size: 15, weight: .medium))
                                        .foregroundStyle(.black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundStyle(.orange)
                                }
                                .padding(.horizontal, 16)
                                .frame(height: 52)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                                )
                            }
                        }
                        
                        // 3. Course
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Course")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            TextField("Bachelor in Software Engineering", text: $tempCourse)
                                .font(.system(size: 15, weight: .medium))
                                .padding(.horizontal, 16)
                                .frame(height: 52)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                                )
                        }
                        
                        // 4. Bio
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Bio")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            ZStack(alignment: .topLeading) {
                                if bioText.isEmpty {
                                    Text("Add something about you!")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.gray.opacity(0.7))
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 14)
                                }
                                
                                TextEditor(text: $bioText)
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .scrollContentBackground(.hidden)
                            }
                            .frame(height: 90)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                            )
                        }
                        
                        // 5. Skills
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Skills")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            ZStack(alignment: .topLeading) {
                                if skillsText.isEmpty {
                                    Text("Add your skills to get to know other buddy!")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.gray.opacity(0.7))
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 14)
                                }
                                
                                TextEditor(text: $skillsText)
                                    .font(.system(size: 14))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .scrollContentBackground(.hidden)
                            }
                            .frame(height: 90)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                            )
                        }
                        
                        // 6. Links
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Links")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            HStack(spacing: 14) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(red: 0.0, green: 0.47, blue: 0.71))
                                        .frame(width: 38, height: 38)
                                    
                                    Text("in")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundStyle(.white)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .font(.system(size: 32, weight: .bold))
                                        .foregroundStyle(.orange)
                                }
                            }
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 36,
                            topTrailingRadius: 36
                        )
                    )
                    .padding(.top, 20)
                }
            }
        }
        .sheet(isPresented: $showCameraPicker) {
            CameraPicker(selectedImage: $uiImage)
                .onChange(of: uiImage) { _, newImg in
                    if let newImg {
                        avatarImage = Image(uiImage: newImg)
                    }
                }
        }
        .onAppear {
            tempName = userName
            tempCourse = userCourse
            selectedUniversity = userCampus
        }
    }
}


// MARK: - NOTIFICATIONS SHEET VIEW

struct NotificationsSheetView: View {
    @Environment(\.dismiss) private var dismiss
    
    let notifications = [
        ("Hana sent you a message in Buddy Chat", "5m ago", "hands.clap.fill", Color.orange),
        ("Your note 'Calculus 1 Summaries' got 12 downloads!", "1h ago", "arrow.down.circle.fill", Color.blue),
        ("Fahmi requested to connect as a Buddy", "3h ago", "person.badge.plus.fill", Color.green),
        ("New listing posted in Marketplace near you", "1d ago", "bag.fill", Color.purple)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(notifications, id: \.0) { item in
                    HStack(spacing: 14) {
                        Image(systemName: item.2)
                            .font(.system(size: 20))
                            .foregroundStyle(item.3)
                            .frame(width: 36, height: 36)
                            .background(item.3.opacity(0.12))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.0)
                                .font(.system(size: 14, weight: .semibold))
                            Text(item.1)
                                .font(.system(size: 12))
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}


// MARK: - MY BUDDY VIEW

struct ConnectedBuddyModel: Identifiable {
    let id = UUID()
    let name: String
    let university: String
    let course: String
    let skill: String
    let imageName: String
    let status: String
    let isOnline: Bool
    var isFavorite: Bool = false
}

struct MyBuddyView: View {
    @State private var searchText = ""
    @State private var selectedFilter = "All"
    @State private var selectedChatBuddy: String? = nil
    @State private var selectedChatImage: String = "Farah"
    @State private var navigateToChat = false
    
    @State private var buddyRequests = [
        BuddyRequestModel(name: "Hana Humaira", university: "UiTM Shah Alam", note: "Wants to study Data Structures together", imageName: "userHana"),
        BuddyRequestModel(name: "Fahimi Imran", university: "UPSI Main Campus", note: "Wants to learn about AutoCAD & Design", imageName: "userFahimi")
    ]
    
    @State private var buddiesList = [
        ConnectedBuddyModel(
            name: "Farah Nabilah",
            university: "UPSI (Sultan Azlan Shah)",
            course: "Software Engineering",
            skill: "iOS & Swift",
            imageName: "Farah",
            status: "Study Partner",
            isOnline: true,
            isFavorite: true
        ),
        ConnectedBuddyModel(
            name: "Nazirul Danial",
            university: "UPSI Main Campus",
            course: "Computer Science",
            skill: "Data Structures & Java",
            imageName: "Naz",
            status: "Online now",
            isOnline: true,
            isFavorite: true
        ),
        ConnectedBuddyModel(
            name: "Danial Farhan",
            university: "UiTM Shah Alam",
            course: "Information Technology",
            skill: "Database & SQL",
            imageName: "RosesFarhan",
            status: "Active 15m ago",
            isOnline: false,
            isFavorite: false
        ),
        ConnectedBuddyModel(
            name: "Syakir Zufairin",
            university: "UPSI Main Campus",
            course: "Mathematics with Education",
            skill: "Calculus & Linear Algebra",
            imageName: "Syakir",
            status: "Active 1h ago",
            isOnline: true,
            isFavorite: false
        )
    ]
    
    var filteredBuddies: [ConnectedBuddyModel] {
        buddiesList.filter { buddy in
            let matchesSearch = searchText.isEmpty ||
                buddy.name.localizedCaseInsensitiveContains(searchText) ||
                buddy.skill.localizedCaseInsensitiveContains(searchText) ||
                buddy.course.localizedCaseInsensitiveContains(searchText)
            
            let matchesFilter: Bool
            if selectedFilter == "Favorites" {
                matchesFilter = buddy.isFavorite
            } else if selectedFilter == "Online" {
                matchesFilter = buddy.isOnline
            } else {
                matchesFilter = true
            }
            
            return matchesSearch && matchesFilter
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // Header Section
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("My Connected Buddies")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color.color)
                    Text("\(buddiesList.count) buddies connected across campuses")
                        .font(.system(size: 13))
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                NavigationLink {
                    BuddiesChatView()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "person.crop.circle.badge.plus")
                            .font(.system(size: 13, weight: .bold))
                        Text("Find")
                            .font(.system(size: 13, weight: .bold))
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 9)
                    .background(Color.orange)
                    .clipShape(Capsule())
                    .shadow(color: .orange.opacity(0.25), radius: 4, y: 2)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            
            // Search Bar
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search buddies by name, skill, course...", text: $searchText)
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
            .padding(12)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.04), radius: 5, y: 2)
            .padding(.horizontal, 20)
            
            // Filter Pills
            HStack(spacing: 10) {
                ForEach(["All", "Online", "Favorites"], id: \.self) { filter in
                    Button {
                        selectedFilter = filter
                    } label: {
                        Text(filter)
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundStyle(selectedFilter == filter ? .white : Color.color)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 7)
                            .background(selectedFilter == filter ? Color.color : Color.white)
                            .clipShape(Capsule())
                            .shadow(color: .black.opacity(0.04), radius: 4, y: 1)
                    }
                    .buttonStyle(.plain)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 14) {
                    
                    // Pending Requests Banner if any
                    if !buddyRequests.isEmpty && selectedFilter == "All" && searchText.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("Pending Requests (\(buddyRequests.count))")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(Color.color)
                                Spacer()
                            }
                            
                            ForEach(buddyRequests) { req in
                                HStack(spacing: 12) {
                                    Image(req.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 44, height: 44)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(req.name)
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundStyle(Color.color)
                                        Text(req.university)
                                            .font(.system(size: 11.5))
                                            .foregroundStyle(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 8) {
                                        Button {
                                            withAnimation {
                                                buddyRequests.removeAll { $0.id == req.id }
                                            }
                                        } label: {
                                            Text("Decline")
                                                .font(.system(size: 11.5, weight: .semibold))
                                                .foregroundStyle(.gray)
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 5)
                                                .background(Color.gray.opacity(0.12))
                                                .clipShape(Capsule())
                                        }
                                        .buttonStyle(.plain)
                                        
                                        Button {
                                            withAnimation {
                                                buddiesList.append(
                                                    ConnectedBuddyModel(
                                                        name: req.name,
                                                        university: req.university,
                                                        course: "Student",
                                                        skill: req.note,
                                                        imageName: req.imageName,
                                                        status: "New Buddy",
                                                        isOnline: true,
                                                        isFavorite: false
                                                    )
                                                )
                                                buddyRequests.removeAll { $0.id == req.id }
                                            }
                                        } label: {
                                            Text("Accept")
                                                .font(.system(size: 11.5, weight: .bold))
                                                .foregroundStyle(.white)
                                                .padding(.horizontal, 12)
                                                .padding(.vertical, 5)
                                                .background(Color.orange)
                                                .clipShape(Capsule())
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                .padding(12)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: .black.opacity(0.04), radius: 4, y: 1)
                            }
                        }
                        .padding(.bottom, 6)
                    }
                    
                    // Connected Buddies List
                    if filteredBuddies.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "person.2.slash.fill")
                                .font(.system(size: 44))
                                .foregroundStyle(.gray.opacity(0.5))
                            Text("No buddies found")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(Color.color)
                            Text("Try adjusting your search or find new study partners!")
                                .font(.system(size: 12.5))
                                .foregroundStyle(.gray)
                        }
                        .padding(.top, 40)
                    } else {
                        ForEach(filteredBuddies) { buddy in
                            HStack(spacing: 14) {
                                // Avatar with Online Dot
                                ZStack(alignment: .bottomTrailing) {
                                    Image(buddy.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 58, height: 58)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    
                                    if buddy.isOnline {
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 14, height: 14)
                                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                            .offset(x: 2, y: 2)
                                    }
                                }
                                
                                // Info
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack(spacing: 6) {
                                        Text(buddy.name)
                                            .font(.system(size: 15.5, weight: .bold))
                                            .foregroundStyle(Color.color)
                                        
                                        if buddy.isFavorite {
                                            Image(systemName: "star.fill")
                                                .font(.system(size: 11))
                                                .foregroundStyle(.orange)
                                        }
                                    }
                                    
                                    Text(buddy.university)
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(.gray)
                                    
                                    HStack(spacing: 6) {
                                        Text(buddy.skill)
                                            .font(.system(size: 10.5, weight: .semibold))
                                            .foregroundStyle(Color.orange)
                                            .padding(.horizontal, 8)
                                            .padding(.vertical, 3)
                                            .background(Color.orange.opacity(0.12))
                                            .clipShape(Capsule())
                                        
                                        Text("• \(buddy.status)")
                                            .font(.system(size: 11))
                                            .foregroundStyle(.gray)
                                    }
                                }
                                
                                Spacer(minLength: 0)
                                
                                // Chat Button
                                Button {
                                    selectedChatBuddy = buddy.name
                                    selectedChatImage = buddy.imageName
                                    navigateToChat = true
                                } label: {
                                    ZStack {
                                        Circle()
                                            .fill(Color(red: 0.08, green: 0.25, blue: 0.78).opacity(0.1))
                                            .frame(width: 38, height: 38)
                                        
                                        Image(systemName: "message.fill")
                                            .font(.system(size: 15, weight: .bold))
                                            .foregroundStyle(Color(red: 0.08, green: 0.25, blue: 0.78))
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                            .padding(14)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .shadow(color: .black.opacity(0.06), radius: 5, x: 0, y: 2)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                            )
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .background(Color.gray.opacity(0.04).ignoresSafeArea())
        .navigationTitle("My Buddy")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $navigateToChat) {
            ChatDetailView(
                buddyName: selectedChatBuddy ?? "Buddy",
                imageName: selectedChatImage
            )
        }
    }
}


// MARK: - MY NOTES VIEW

struct MyNotesView: View {
    @State private var showUploadSheet = false
    
    @State private var myNotesList = [
        UploadedNoteModel(
            title: "Numerical Methods in Computer Science",
            university: "UPSI",
            pages: 30,
            views: "1.2k views",
            downloads: 142,
            imageName: "computer"
        ),
        UploadedNoteModel(
            title: "Fundamentals of Software Engineering",
            university: "UPSI",
            pages: 45,
            views: "890 views",
            downloads: 98,
            imageName: "fundamental"
        ),
        UploadedNoteModel(
            title: "Java Programming & OOP Masterclass",
            university: "UPSI",
            pages: 35,
            views: "1.1k views",
            downloads: 112,
            imageName: "Java"
        ),
        UploadedNoteModel(
            title: "General Science & Physics Principles",
            university: "UPSI",
            pages: 22,
            views: "650 views",
            downloads: 54,
            imageName: "Science"
        )
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("My Shared Notes")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color.color)
                    Text("\(myNotesList.count) active documents uploaded")
                        .font(.system(size: 13))
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Button {
                    showUploadSheet = true
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.system(size: 13, weight: .bold))
                        Text("Upload")
                            .font(.system(size: 13, weight: .bold))
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 9)
                    .background(Color.orange)
                    .clipShape(Capsule())
                    .shadow(color: .orange.opacity(0.25), radius: 4, y: 2)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 14) {
                    ForEach(myNotesList) { note in
                        NavigationLink {
                            NoteDetailView(
                                title: note.title,
                                subject: "Computer Science",
                                author: "Syakir Zufairin",
                                authorImage: "Syakir",
                                time: "Uploaded 2 days ago",
                                views: note.views,
                                description: "Self-authored lecture notes and practice exercises for UPSI students.",
                                university: note.university,
                                noteType: "Lecture Notes",
                                noteImage: note.imageName,
                                previewImages: [note.imageName, note.imageName]
                            )
                        } label: {
                            HStack(spacing: 14) {
                                Image(note.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 65, height: 78)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(note.title)
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundStyle(Color.color)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text("\(note.university) • \(note.pages) pages")
                                        .font(.system(size: 13))
                                        .foregroundStyle(.gray)
                                    
                                    HStack(spacing: 12) {
                                        Label(note.views, systemImage: "eye.fill")
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundStyle(Color.orange)
                                        
                                        Label("\(note.downloads) downloads", systemImage: "arrow.down.circle.fill")
                                            .font(.system(size: 12, weight: .semibold))
                                            .foregroundStyle(Color.blue)
                                    }
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
                .padding(.bottom, 30)
            }
        }
        .background(Color.gray.opacity(0.04).ignoresSafeArea())
        .navigationTitle("My Notes")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showUploadSheet) {
            UploadNotesView()
        }
    }
}

struct UploadedNoteModel: Identifiable {
    let id = UUID()
    let title: String
    let university: String
    let pages: Int
    let views: String
    let downloads: Int
    let imageName: String
}


// MARK: - MY LISTING VIEW

struct MyListingView: View {
    @State private var showSellSheet = false
    
    @State private var myListings = [
        UserListingModel(
            title: "Engineering Mathematics Textbook",
            price: "RM20",
            status: "Active",
            imageName: "Calculator",
            location: "UPSI Main Campus"
        ),
        UserListingModel(
            title: "Casio Scientific Calculator FX-570EX",
            price: "RM45",
            status: "Active",
            imageName: "Calculator",
            location: "Kolej Harun Aminurrashid"
        ),
        UserListingModel(
            title: "Lab Coat Size M",
            price: "RM15",
            status: "Sold",
            imageName: "Image 1",
            location: "Kolej Za'ba"
        )
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("My Marketplace Items")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color.color)
                    Text("Manage items you are selling on campus")
                        .font(.system(size: 13))
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Button {
                    showSellSheet = true
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 13, weight: .bold))
                        Text("Add Item")
                            .font(.system(size: 13, weight: .bold))
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 9)
                    .background(Color.orange)
                    .clipShape(Capsule())
                    .shadow(color: .orange.opacity(0.25), radius: 4, y: 2)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 14) {
                    ForEach($myListings) { $item in
                        HStack(spacing: 14) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .padding(4)
                                .background(Color.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.title)
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundStyle(Color.color)
                                    .lineLimit(2)
                                
                                Text(item.price)
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundStyle(Color.orange)
                                
                                Text(item.location)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer(minLength: 0)
                            
                            Button {
                                item.status = (item.status == "Active") ? "Sold" : "Active"
                            } label: {
                                Text(item.status)
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundStyle(item.status == "Active" ? Color.green : Color.gray)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background((item.status == "Active" ? Color.green : Color.gray).opacity(0.15))
                                    .clipShape(Capsule())
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
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .background(Color.gray.opacity(0.04).ignoresSafeArea())
        .navigationTitle("My Listing")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showSellSheet) {
            SellItemView()
        }
    }
}

struct UserListingModel: Identifiable {
    let id = UUID()
    let title: String
    let price: String
    var status: String
    let imageName: String
    let location: String
}


// MARK: - SUBSCRIPTION VIEW

struct SubscriptionView: View {
    @State private var isSubscribed: Bool = false
    @State private var showSuccessAlert: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                
                VStack(spacing: 10) {
                    ZStack {
                        Circle()
                            .fill(Color.orange.opacity(0.15))
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "diamond.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(Color.orange)
                    }
                    
                    Text("CampusBuddy PRO")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(Color.color)
                    
                    Text("Unlock unlimited note downloads, priority buddy matching, and featured marketplace listings.")
                        .font(.system(size: 13.5, weight: .regular))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
                .padding(.top, 16)
                
                // MONTHLY PLAN CARD
                VStack(spacing: 8) {
                    Text("MONTHLY SUBSCRIPTION")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundStyle(Color.orange)
                        .tracking(1)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text("RM9.90")
                            .font(.system(size: 38, weight: .bold))
                            .foregroundStyle(Color.color)
                        Text("/ month")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(.gray)
                    }
                    
                    Text("Billed monthly. Cancel anytime with 1-click.")
                        .font(.system(size: 12.5, weight: .medium))
                        .foregroundStyle(.gray)
                }
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.orange.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(Color.orange.opacity(0.4), lineWidth: 1.5)
                )
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 14) {
                    FeatureCheckRow(title: "Unlimited PDF & Notes Downloads")
                    FeatureCheckRow(title: "Featured PRO Badge on Profile & Search")
                    FeatureCheckRow(title: "Priority Listing Boost in Marketplace")
                    FeatureCheckRow(title: "Direct Buddy Messaging & Instant Match")
                    FeatureCheckRow(title: "Ad-free CampusBuddy Experience")
                }
                .padding(.horizontal, 24)
                .padding(.top, 6)
                
                Button {
                    isSubscribed.toggle()
                    if isSubscribed {
                        showSuccessAlert = true
                    }
                } label: {
                    Text(isSubscribed ? "Subscription Active ✓ (Tap to Manage)" : "Subscribe Monthly for RM9.90")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(isSubscribed ? Color.green : Color.orange)
                        .clipShape(Capsule())
                        .shadow(color: (isSubscribed ? Color.green : Color.orange).opacity(0.3), radius: 8, y: 4)
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                
                Spacer(minLength: 40)
            }
        }
        .navigationTitle("Subscription")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .alert("Welcome to CampusBuddy PRO!", isPresented: $showSuccessAlert) {
            Button("Got it!", role: .cancel) { }
        } message: {
            Text("Your Monthly PRO membership is now active! Enjoy unlimited note downloads and priority features.")
        }
    }
}

struct FeatureCheckRow: View {
    let title: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.orange)
            
            Text(title)
                .font(.system(size: 14.5, weight: .medium))
                .foregroundStyle(Color.black.opacity(0.85))
        }
    }
}


// MARK: - PREVIEW

#Preview {
    ProfileView()
}
