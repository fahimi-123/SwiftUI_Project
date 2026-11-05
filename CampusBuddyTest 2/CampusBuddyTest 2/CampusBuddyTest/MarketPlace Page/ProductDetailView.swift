//
//  Detail.swift
//  CampusBuddyNew
//
//  Created by STDCX_MACBOOK PRO 10 on 09/08/2026.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var authManager = UserAuthManager.shared
    @State private var showChatWithSeller = false
    
    let imageName: String
    let title: String
    let price: String
    let location: String
    var sellerName: String = "Naz"
    var sellerImage: String = "Naz"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                
                // MARK: Image Banner Box
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 340, height: 340)

                    Image(imageName.isEmpty ? "Calculator" : imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .clipped()
                }
                
                // MARK: Title & Price
                VStack(alignment: .leading, spacing: 10) {
                    Text(title.isEmpty ? "Texas Instruments Calculator" : title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.blue)
                    
                    Text(price.isEmpty ? "RM 120" : price)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.orange)
                    
                    HStack {
                        Label(location.isEmpty ? "UiTM Shah Alam" : location, systemImage: "mappin.and.ellipse")
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("Posted 2 days ago")
                            .foregroundColor(.gray)
                    }
                }
                
                // MARK: Seller Card
                HStack(spacing: 15) {
                    Image(sellerImage.isEmpty ? "Naz" : sellerImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 3)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(sellerName.isEmpty ? "Naz" : sellerName)
                            .font(.title3.bold())
                            .foregroundColor(.blue)
                        
                        Text(location.isEmpty ? "UPSI Main Campus" : location)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        HStack(spacing: 6) {
                            Circle()
                                .fill(.green)
                                .frame(width: 10, height: 10)
                            
                            Text("Active 1 hour ago")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                }
                .padding(14)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.06), radius: 5, y: 2)
                
                // MARK: Description
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.title2.bold())
                        .foregroundColor(.blue)
                    
                    Text("""
                    Used only for 1 semester. Good condition.
                    No highlights or writing inside.
                    Perfect for Engineering students!
                    """)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: Chat Seller Button
                Button {
                    if authManager.requireAuth(for: "chatting with sellers") {
                        showChatWithSeller = true
                    }
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "envelope.fill")
                            .font(.system(size: 16, weight: .bold))
                        
                        Text("Chat Seller")
                            .font(.system(size: 16, weight: .bold))
                    }
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(Color.blue, lineWidth: 2)
                    )
                }
                .buttonStyle(.plain)
                
                Spacer(minLength: 40)
            }
            .padding(18)
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
        .background(Color(.systemGroupedBackground))
        .sheet(isPresented: $authManager.showAuthModal) {
            AuthRequiredModalSheet()
        }
        .navigationDestination(isPresented: $showChatWithSeller) {
            ChatDetailView(buddyName: sellerName.isEmpty ? "Naz" : sellerName, imageName: sellerImage.isEmpty ? "Naz" : sellerImage)
        }
    }
}

#Preview {
    NavigationStack {
        ProductDetailView(
            imageName: "Calculator",
            title: "Texas Instruments Calculator",
            price: "RM 120",
            location: "UiTM Shah Alam",
            sellerName: "Naz",
            sellerImage: "Naz"
        )
    }
}
