//
//  SplashView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 13/08/2026.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isActive = false
    @State private var animateMascot = false
    
    // Custom Exact Hex Colors: #1E3ABA (BLUE) & #F97316 (ORANGE)
    let blueColor = Color(red: 0.118, green: 0.227, blue: 0.729)  // #1E3ABA
    let orangeColor = Color(red: 0.976, green: 0.451, blue: 0.086) // #F97316
    
    var body: some View {
        if isActive {
            MainView()
                .transition(.opacity.combined(with: .scale(scale: 1.02)))
        } else {
            ZStack {
                // MARK: - GRADIENT BACKGROUND (#1E3ABA BLUE TO #F97316 ORANGE)
                LinearGradient(
                    colors: [
                        blueColor,
                        orangeColor
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // MARK: - PERFECTLY CENTERED EXTRA-LARGE OWL MASCOT (TEXT REMOVED)
                VStack {
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .scaleEffect(animateMascot ? 1.0 : 0.85)
                        .opacity(animateMascot ? 1.0 : 0.0)
                        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.45)) {
                    isActive = true
                }
            }
            .onAppear {
                withAnimation(.spring(response: 0.7, dampingFraction: 0.68)) {
                    animateMascot = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
