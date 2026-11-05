//
//  UserAuthManager.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 14/08/2026.
//

import SwiftUI
import Combine

class UserAuthManager: ObservableObject {
    static let shared = UserAuthManager()
    
    @Published var isLoggedIn: Bool = false
    @Published var userName: String = "Guest"
    @Published var userEmail: String = ""
    @Published var userUniversity: String = "UPSI"
    @Published var userPhoto: String = "guest_avatar"
    
    // Auth Sheets Controlled Safely to Prevent Dismiss Navigation Crashes
    @Published var showAuthModal: Bool = false
    @Published var showSignUpSheet: Bool = false
    @Published var showLoginSheet: Bool = false
    @Published var authModalFeatureName: String = "this material"
    
    func login(name: String, email: String, university: String = "UPSI") {
        withAnimation(.easeInOut(duration: 0.35)) {
            self.userName = name.isEmpty ? "Syakir" : name
            self.userEmail = email
            self.userUniversity = university
            self.userPhoto = "KimiPhoto"
            self.isLoggedIn = true
            
            // Safely close all auth modal sheets
            self.showAuthModal = false
            self.showSignUpSheet = false
            self.showLoginSheet = false
        }
    }
    
    func logout() {
        withAnimation(.easeInOut(duration: 0.35)) {
            self.isLoggedIn = false
            self.userName = "Guest"
            self.userPhoto = "guest_avatar"
        }
    }
    
    func requireAuth(for feature: String = "this material") -> Bool {
        if isLoggedIn {
            return true
        } else {
            self.authModalFeatureName = feature
            self.showAuthModal = true
            return false
        }
    }
}
