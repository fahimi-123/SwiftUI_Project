//
//  ChatDetailsView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 13/08/2026.
//

import SwiftUI

struct ChatDetailView: View {
    
    let buddyName: String
    let imageName: String
    
    @State private var messageText = ""
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // MARK: Header
            
            HStack(spacing: 14) {
                
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: 48,
                        height: 48
                    )
                    .clipShape(Circle())
                
                VStack(
                    alignment: .leading,
                    spacing: 2
                ) {
                    
                    Text(buddyName)
                        .font(.headline.bold())
                    
                    Text("Online")
                        .font(.caption)
                        .foregroundColor(.green)
                }
                
                Spacer()
            }
            .padding()
            .background(.white)
            .shadow(
                color: .black.opacity(0.08),
                radius: 4,
                y: 2
            )
            
            // MARK: Chat Area
            
            ScrollView {
                
                VStack(
                    alignment: .leading,
                    spacing: 15
                ) {
                    
                    ChatBubble(
                        text: "Hey! 👋",
                        isMe: false
                    )
                    
                    ChatBubble(
                        text: "Hi \(buddyName)! How are you?",
                        isMe: true
                    )
                    
                    ChatBubble(
                        text: "I'm good! Are you free to study later?",
                        isMe: false
                    )
                }
                .padding()
            }
            
            Spacer(minLength: 0)
            
            // MARK: Message Input
            
            HStack(spacing: 10) {
                
                TextField(
                    "Message...",
                    text: $messageText
                )
                .padding(.horizontal, 18)
                .frame(height: 48)
                .background(
                    Color(.systemGray6)
                )
                .clipShape(Capsule())
                
                Button {
                    
                    if !messageText.trimmingCharacters(
                        in: .whitespacesAndNewlines
                    ).isEmpty {
                        messageText = ""
                    }
                    
                } label: {
                    
                    Image(
                        systemName:
                            "paperplane.fill"
                    )
                    .foregroundColor(.white)
                    .frame(
                        width: 48,
                        height: 48
                    )
                    .background(
                        Color(
                            red: 0.08,
                            green: 0.25,
                            blue: 0.78
                        )
                    )
                    .clipShape(Circle())
                }
            }
            .padding()
            .background(.white)
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
}
