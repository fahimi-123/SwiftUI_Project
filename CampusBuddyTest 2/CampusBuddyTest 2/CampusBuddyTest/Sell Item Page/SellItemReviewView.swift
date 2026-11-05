//
//  SellItemReviewView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 09/08/2026.
//

import SwiftUI
import UIKit

struct SellItemReviewView: View {
    @Environment(\.dismiss) private var dismiss
    
    let itemName: String
    let description: String
    let price: String
    let condition: String
    let selectedImage: UIImage?
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 22) {
                    
                    // MARK: - Header
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 38, height: 38)
                                    .shadow(color: .black.opacity(0.12), radius: 4, y: 2)
                                
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(Color.color)
                            }
                        }
                        .buttonStyle(.plain)
                        
                        Spacer()
                        
                        VStack(spacing: 3) {
                            Text("Review Item")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(Color.color)
                            
                            Text("Check details before publishing")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Color.clear
                            .frame(width: 38, height: 38)
                    }
                    .padding(.top, 4)
                    
                    
                    // MARK: - Progress
                    VStack(spacing: 8) {
                        HStack {
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 34, height: 34)
                                .overlay {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                            
                            Capsule()
                                .fill(Color.orange)
                                .frame(height: 4)
                            
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 34, height: 34)
                                .overlay {
                                    Text("2")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                            
                            Capsule()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 4)
                            
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 34, height: 34)
                                .overlay {
                                    Text("3")
                                        .bold()
                                }
                        }
                        
                        HStack {
                            Text("Details")
                                .foregroundColor(Color.orange)
                            Spacer()
                            Text("Review")
                                .foregroundColor(Color.orange)
                            Spacer()
                            Text("Publish")
                                .foregroundColor(.gray)
                        }
                        .font(.caption.bold())
                    }
                    
                    
                    // MARK: - Item Preview Card
                    VStack(spacing: 14) {
                        Text("Item Preview")
                            .font(.title3.bold())
                            .foregroundStyle(Color.color)
                        
                        if let selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 280, height: 240)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(Color.gray.opacity(0.15))
                                Image(systemName: "photo")
                                    .font(.system(size: 50))
                                    .foregroundStyle(.gray)
                            }
                            .frame(width: 280, height: 240)
                        }
                    }
                    
                    
                    // MARK: - Item Information Details Card
                    VStack(alignment: .leading, spacing: 14) {
                        Text(itemName)
                            .font(.title2.bold())
                            .foregroundColor(Color.color)
                        
                        HStack {
                            Text("RM \(price)")
                                .font(.title3.bold())
                                .foregroundColor(Color.orange)
                            
                            Spacer()
                            
                            Text(condition)
                                .font(.subheadline.bold())
                                .padding(.horizontal, 14)
                                .padding(.vertical, 6)
                                .background(Color.orange.opacity(0.15))
                                .foregroundColor(Color.orange)
                                .clipShape(Capsule())
                        }
                        
                        Divider()
                        
                        Text("Description")
                            .font(.headline.bold())
                            .foregroundColor(Color.color)
                        
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .lineSpacing(4)
                        
                        Divider()
                        
                        Text("Seller Information")
                            .font(.headline.bold())
                            .foregroundColor(Color.color)
                        
                        HStack(spacing: 12) {
                            Image("KimiPhoto")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Syakir Zufairin")
                                    .font(.headline.bold())
                                    .foregroundStyle(Color.color)
                                Text("UPSI (Universiti Pendidikan Sultan Idris)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                    }
                    .padding(18)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .shadow(color: .black.opacity(0.05), radius: 6)
                    
                    Spacer(minLength: 60)
                }
                .padding(.horizontal, 18)
            }
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        
        // MARK: - Action Toolbar
        .safeAreaInset(edge: .bottom) {
            NavigationLink {
                SellItemPublishView(
                    itemName: itemName,
                    description: description,
                    price: price,
                    condition: condition
                )
            } label: {
                Text("Next: Publish")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .shadow(color: .black.opacity(0.06), radius: 6, y: -2)
                    .ignoresSafeArea(edges: .bottom)
            )
        }
    }
}

#Preview {
    SellItemReviewView(
        itemName: "Engineering Mathematics Textbook",
        description: "Used only for 1 semester. Good condition. No highlights or writing inside. Perfect for Engineering students!",
        price: "20",
        condition: "Good",
        selectedImage: nil
    )
}
