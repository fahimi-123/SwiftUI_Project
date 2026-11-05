//
//  AuthRequiredModalSheet.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 14/08/2026.
//

import SwiftUI

struct AuthRequiredModalSheet: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var authManager = UserAuthManager.shared
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // Shield / Lock Badge Icon
                ZStack {
                    Circle()
                        .fill(Color.orange.opacity(0.12))
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: "lock.shield.fill")
                        .font(.system(size: 36))
                        .foregroundStyle(Color.orange)
                }
                .padding(.top, 28)
                
                // Title & Description
                VStack(spacing: 8) {
                    Text("Sign In or Sign Up")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.color)
                    
                    Text("To access \(authManager.authModalFeatureName), please sign in to your student account or sign up below.")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }
                
                Spacer()
                
                // Action Buttons: Sign Up & Sign In
                VStack(spacing: 12) {
                    
                    // 1. Sign Up Button (Primary Orange)
                    Button {
                        authManager.showAuthModal = false
                        authManager.showSignUpSheet = true
                    } label: {
                        Text("Sign Up")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color.orange)
                            .clipShape(Capsule())
                            .shadow(color: .orange.opacity(0.3), radius: 6, y: 3)
                    }
                    
                    // 2. Sign In Button (Secondary Blue Outline)
                    Button {
                        authManager.showAuthModal = false
                        authManager.showLoginSheet = true
                    } label: {
                        Text("Sign In")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(Color.color)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .overlay(
                                Capsule()
                                    .stroke(Color.color, lineWidth: 1.5)
                            )
                    }
                    
                    // Cancel Button
                    Button {
                        authManager.showAuthModal = false
                    } label: {
                        Text("Cancel")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.gray)
                    }
                    .padding(.top, 4)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    AuthRequiredModalSheet()
}
