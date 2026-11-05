//
//  ChatView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 13/08/2026.
//

import SwiftUI

struct ChatBubble: View {
    
    let text: String
    let isMe: Bool
    
    var body: some View {
        
        HStack {
            
            if isMe {
                Spacer()
            }
            
            Text(text)
                .foregroundColor(
                    isMe ? .white : .black
                )
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    isMe
                    ? Color(
                        red: 0.08,
                        green: 0.25,
                        blue: 0.78
                    )
                    : Color(.systemGray5)
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 18
                    )
                )
            
            if !isMe {
                Spacer()
            }
        }
    }
}



