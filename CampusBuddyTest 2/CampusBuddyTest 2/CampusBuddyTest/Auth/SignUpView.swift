//
//  SignUpView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 14/08/2026.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var authManager = UserAuthManager.shared
    
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var university: String = "UPSI (Universiti Pendidikan Sultan Idris)"
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var navigateToLogin: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // Background
                Color(red: 0.96, green: 0.97, blue: 0.99)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        
                        // Header Title
                        VStack(spacing: 8) {
                            HStack(spacing: 0) {
                                Text("Campus")
                                    .foregroundStyle(Color.color)
                                Text("Buddy")
                                    .foregroundStyle(.orange)
                            }
                            .font(.system(size: 30, weight: .bold))
                            .padding(.top, 16)
                            
                            Text("Create your student account to get full access to notes, buddies & marketplace!")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundStyle(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 24)
                        }
                        
                        // Form Card
                        VStack(spacing: 16) {
                            
                            // Full Name Input
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Full Name")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundStyle(Color.color)
                                
                                HStack {
                                    Image(systemName: "person.fill")
                                        .foregroundStyle(.orange)
                                    TextField("Enter your full name (e.g. Syakir)", text: $fullName)
                                        .font(.system(size: 14))
                                }
                                .padding(14)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                            }
                            
                            // Student Email Input
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Student Email")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundStyle(Color.color)
                                
                                HStack {
                                    Image(systemName: "envelope.fill")
                                        .foregroundStyle(.orange)
                                    TextField("student@siswa.upsi.edu.my", text: $email)
                                        .font(.system(size: 14))
                                        .textInputAutocapitalization(.never)
                                        .keyboardType(.emailAddress)
                                }
                                .padding(14)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                            }
                            
                            // University Selection Input
                            VStack(alignment: .leading, spacing: 6) {
                                Text("University")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundStyle(Color.color)
                                
                                HStack {
                                    Image(systemName: "building.columns.fill")
                                        .foregroundStyle(.orange)
                                    TextField("University Name", text: $university)
                                        .font(.system(size: 14))
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
                                    SecureField("Create a strong password", text: $password)
                                        .font(.system(size: 14))
                                }
                                .padding(14)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                            }
                            
                            // Sign Up Action Button -> Leads to Login Screen
                            Button {
                                navigateToLogin = true
                            } label: {
                                Text("Sign Up")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 52)
                                    .background(Color.orange)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .shadow(color: .orange.opacity(0.3), radius: 8, y: 4)
                            }
                            .buttonStyle(.plain)
                            .padding(.top, 8)
                            
                            // Already have account -> Go to Login
                            HStack {
                                Text("Already have an account?")
                                    .font(.system(size: 13))
                                    .foregroundStyle(.gray)
                                
                                Button {
                                    navigateToLogin = true
                                } label: {
                                    Text("Log In")
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundStyle(Color.color)
                                }
                            }
                            .padding(.top, 4)
                        }
                        .padding(20)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .shadow(color: .black.opacity(0.06), radius: 10, y: 4)
                        .padding(.horizontal, 20)
                    }
                    .padding(.vertical, 20)
                }
            }
            .navigationTitle("Student Registration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView(
                    registeredName: fullName.isEmpty ? "Syakir" : fullName,
                    registeredEmail: email.isEmpty ? "syakir@siswa.upsi.edu.my" : email
                )
            }
        }
    }
}

#Preview {
    SignUpView()
}
