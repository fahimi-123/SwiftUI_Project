//
//  NoteDetailView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 11/08/2026.
//

import SwiftUI

struct NoteDetailView: View {
    
    let title: String
    let subject: String
    let author: String
    var authorImage: String = "RosesFarhan"
    let time: String
    let views: String
    
    let description: String
    let university: String
    let noteType: String
    
    let noteImage: String
    let previewImages: [String]
    
    @Environment(\.dismiss) private var dismiss
    @State private var showDownloadPopup = false
    @State private var showSavePopup = false
    @State private var showSharePopup = false
    @State private var isSaved = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color(red: 0.97, green: 0.98, blue: 0.99)
                .ignoresSafeArea()
            
            // MARK: - 1. MAIN SCROLLABLE CONTENT (NAV BAR REMOVED)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 22) {
                    
                    // MARK: - NOTE COVER & BASIC INFO CARD
                    HStack(alignment: .top, spacing: 16) {
                        // Cover Image
                        Image(noteImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 165)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                            )
                        
                        // Info Column
                        VStack(alignment: .leading, spacing: 8) {
                            // Subject Tag Capsule
                            Text(subject)
                                .font(.system(size: 11, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .background(Color.orange)
                                .clipShape(Capsule())
                            
                            // Note Title
                            Text(title)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.color)
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
                            
                            // Note Type & Views
                            VStack(alignment: .leading, spacing: 4) {
                                Text(noteType)
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundStyle(.gray)
                                
                                HStack(spacing: 6) {
                                    Image(systemName: "eye.fill")
                                        .font(.system(size: 11))
                                        .foregroundStyle(.orange)
                                    
                                    Text("\(views) views • \(time)")
                                        .font(.system(size: 11.5, weight: .medium))
                                        .foregroundStyle(.gray)
                                }
                            }
                            .padding(.top, 2)
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .padding(16)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 3)
                    .padding(.horizontal, 20)
                    .padding(.top, 12)
                    
                    
                    // MARK: - AUTHOR CARD (Apple Grouped Style)
                    HStack(spacing: 14) {
                        Image(authorImage.isEmpty ? "RosesFarhan" : authorImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 54, height: 54)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(author)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            Text(university)
                                .font(.system(size: 12.5, weight: .medium))
                                .foregroundStyle(.gray)
                            
                            Text("Verified Student Author")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundStyle(Color.orange)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 22))
                            .foregroundStyle(Color.orange)
                    }
                    .padding(14)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 2)
                    .padding(.horizontal, 20)
                    
                    
                    // MARK: - DESCRIPTION SECTION
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.color)
                        
                        Text(description)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.gray.opacity(0.9))
                            .lineSpacing(5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(18)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 2)
                    .padding(.horizontal, 20)
                    
                    
                    // MARK: - PREVIEW PAGES SECTION
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Preview Pages")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            Spacer()
                            
                            Text("\(previewImages.count) Pages")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 14) {
                                ForEach(Array(previewImages.enumerated()), id: \.offset) { index, image in
                                    VStack(spacing: 6) {
                                        Image(image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 140, height: 190)
                                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                            .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                            )
                                        
                                        Text("Page \(index + 1)")
                                            .font(.system(size: 11, weight: .semibold))
                                            .foregroundStyle(.gray)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 4)
                        }
                    }
                    
                    Spacer(minLength: 120)
                }
                .padding(.top, 52)
                .padding(.bottom, 20)
            }
            
            // MARK: - 2. FLOATING BACK BUTTON AT TOP LEFT
            Button {
                dismiss()
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 38, height: 38)
                        .shadow(color: .black.opacity(0.12), radius: 6, x: 0, y: 3)
                    
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.color)
                }
            }
            .buttonStyle(.plain)
            .padding(.leading, 18)
            .padding(.top, 10)
            
            // MARK: - 3. APPLE STYLE FROSTED BOTTOM TOOLBAR OVERLAY
            VStack(spacing: 0) {
                Spacer()
                
                HStack(spacing: 12) {
                    
                    // 1. SHARE BUTTON (Secondary Action)
                    Button {
                        showSharePopup = true
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 15, weight: .bold))
                            Text("Share")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .foregroundStyle(Color.color)
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.12))
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    
                    // 2. SAVE BUTTON (Secondary Accent Action)
                    Button {
                        isSaved.toggle()
                        showSavePopup = true
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                                .font(.system(size: 15, weight: .bold))
                            Text(isSaved ? "Saved" : "Save")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .foregroundStyle(isSaved ? Color.blue : Color.color)
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .background(isSaved ? Color.blue.opacity(0.12) : Color.gray.opacity(0.12))
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    
                    // 3. DOWNLOAD BUTTON (Primary Action Capsule)
                    Button {
                        showDownloadPopup = true
                    } label: {
                        HStack(spacing: 6) {
                            Image(systemName: "arrow.down.doc.fill")
                                .font(.system(size: 15, weight: .bold))
                            Text("Download")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .clipShape(Capsule())
                        .shadow(color: .orange.opacity(0.35), radius: 6, y: 3)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .shadow(color: .black.opacity(0.08), radius: 10, y: -4)
                        .ignoresSafeArea(edges: .bottom)
                )
            }
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .sheet(isPresented: $showSharePopup) {
            VStack(spacing: 20) {
                Text("Share Notes")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.color)
                
                Text("Share this lecture note with fellow campus buddies")
                    .font(.system(size: 13))
                    .foregroundStyle(.gray)
                
                HStack(spacing: 24) {
                    ShareOptionButton(icon: "message.fill", title: "WhatsApp", color: Color.green)
                    ShareOptionButton(icon: "paperplane.fill", title: "Telegram", color: Color.blue)
                    ShareOptionButton(icon: "camera.fill", title: "Instagram", color: Color.pink)
                }
                .padding(.top, 6)
                
                Button {
                    showSharePopup = false
                } label: {
                    Text("Close")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity)
                        .frame(height: 46)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Capsule())
                }
                .padding(.top, 10)
            }
            .padding(24)
            .presentationDetents([.height(260)])
        }
        .alert("Saved Successfully", isPresented: $showSavePopup) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("This note has been saved to your bookmark collection.")
        }
        .alert("Download Complete", isPresented: $showDownloadPopup) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("The lecture notes PDF has been saved to your Files.")
        }
    }
}

// MARK: - SHARE OPTION BUTTON COMPONENT

struct ShareOptionButton: View {
    let icon: String
    let title: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.12))
                    .frame(width: 52, height: 52)
                
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .foregroundStyle(color)
            }
            
            Text(title)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color.color)
        }
    }
}

#Preview {
    NoteDetailView(
        title: "Numerical Methods in Computer Science",
        subject: "Computer Science",
        author: "Faris Danial",
        authorImage: "RosesFarhan",
        time: "2 days ago",
        views: "1.2k",
        description: "Comprehensive lecture notes and solved practice questions for student revision.",
        university: "UPSI",
        noteType: "Lecture Notes",
        noteImage: "Note1",
        previewImages: ["Note1", "SubNote1"]
    )
}
