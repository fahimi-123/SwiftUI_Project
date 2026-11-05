//
//  NoteCard.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 11/08/2026.
//

import SwiftUI

struct NoteCard: View {
    
    let title: String
    let subject: String
    let author: String
    let time: String
    let views: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            // IMAGE
            Image("Note1")
                .resizable()
                .scaledToFill()
                .frame(
                    maxWidth: .infinity,maxHeight: 150
                )
                .clipped()
                .clipShape(
                    RoundedRectangle(cornerRadius: 20)
                )
            
            
    
            Text(title)
                .font(
                    .system(
                        size: 14,
                        weight: .bold
                    )
                )
                .foregroundColor(.blue)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            
        
            Text(subject)
                .font(
                    .system(
                        size: 10,
                        weight: .semibold
                    )
                )
                .foregroundColor(.blue)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.orange)
                .clipShape(Capsule())
            
            
            // AUTHOR
            HStack(spacing: 8) {
                
                Image("KimiPhoto")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: 35,
                        height: 35
                    )
                    .clipShape(Circle())
                
                VStack(
                    alignment: .leading,
                    spacing: 2
                ) {
                    
                    Text(author)
                        .font(
                            .system(
                                size: 12,
                                weight: .bold
                            )
                        )
                        .foregroundColor(.black)
                    
                    Text(time)
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
            }
            
            
            // BOTTOM
            HStack {
                
                HStack(spacing: 5) {
                    
                    Image(systemName: "eye")
                    
                    Text(views)
                }
                .font(.system(size: 11))
                .foregroundColor(.gray)
                
                Spacer(minLength: 0)
                
                
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.black)
                    .frame(width: 40, height: 40)
                   
                
                Image(systemName: "ellipsis")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
        }
        .padding(10)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(cornerRadius: 22)
        )
        .shadow(
            color: .black.opacity(0.12),
            radius: 5,
            y: 3
        )
    }
}

#Preview {
    NoteCard(
        title: "Data Structures Summary Notes",
        subject: "Computer Science",
        author: "Aiman Hakimi",
        time: "2 hours ago",
        views: "125"
    )
    .frame(width: 150)
    .padding()
}
