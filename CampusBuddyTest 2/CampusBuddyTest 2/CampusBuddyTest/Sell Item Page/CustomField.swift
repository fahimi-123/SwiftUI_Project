//
//  CustomField.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 11/08/2026.
//


import SwiftUI

struct CustomField: View {
    
    let title: String
    let placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            
            Text(title)
                .font(.headline.bold())
                .foregroundStyle(.color)
            
            TextField(
                placeholder,
                text: $text
            )
            .font(.body)
            .padding(.horizontal, 16)
            .frame(height: 55)
            .background(.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 18
                )
            )
            .overlay {
                RoundedRectangle(
                    cornerRadius: 18
                )
                .stroke(
                    .gray.opacity(0.15),
                    lineWidth: 1
                )
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}
