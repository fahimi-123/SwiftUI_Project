//
//  LoginView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 14/08/2026.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var authManager = UserAuthManager.shared
    
    var registeredName: String = "Syakir"
    var registeredEmail: String = "syakir@siswa.upsi.edu.my"
    
    @State private var email: String = ""
    @State private var password: String = "••••••••"
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(red: 0.96, green: 0.97, blue: 0.99)
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    
                    // Header Title
                    VStack(spacing: 8) {
                        HStack(spacing: 0) {
                            Text("Campus")
                                .foregroundStyle(Color.color)
                            Text("Buddy")
                                .foregroundStyle(.orange)
                        }
                        .font(.system(size: 32, weight: .bold))
                        .padding(.top, 20)
                        
                        Text("Welcome back! Log in to continue your campus journey.")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                    }
                    
                    // Form Card
                    VStack(spacing: 18) {
                        
                        // Email Input
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Student Email")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            HStack {
                                Image(systemName: "envelope.fill")
                                    .foregroundStyle(.orange)
                                TextField("Enter student email", text: $email)
                                    .font(.system(size: 14))
                                    .textInputAutocapitalization(.never)
                                    .keyboardType(.emailAddress)
                            }
                            .padding(14)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                        }
                        
                        // Password Input
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Password")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            HStack {
                                Image(systemName: "lock.fill")
                                    .foregroundStyle(.orange)
                                SecureField("Enter password", text: $password)
                                    .font(.system(size: 14))
                            }
                            .padding(14)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                        }
                        
                        // Log In Action Button
                        Button {
                            authManager.login(name: registeredName, email: email)
                        } label: {
                            Text("Log In")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 52)
                                .background(Color.color)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: Color.color.opacity(0.3), radius: 8, y: 4)
                        }
                        .buttonStyle(.plain)
                        .padding(.top, 8)
                    }
                    .padding(22)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(color: .black.opacity(0.06), radius: 10, y: 4)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
            }
            .navigationTitle("Student Sign In")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .onAppear {
                if email.isEmpty {
                    email = registeredEmail
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
