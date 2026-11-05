//
//  SellItemPublish.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 09/08/2026.
//

import SwiftUI

struct SellItemPublishView: View {
    @Environment(\.dismiss) private var dismiss
    
    let itemName: String
    let description: String
    let price: String
    let condition: String
    
    @State private var published = false
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
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
                    
                    Text("Publish Item")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.color)
                    
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
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        
                        Capsule()
                            .fill(Color.orange)
                            .frame(height: 4)
                        
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 34, height: 34)
                            .overlay {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                        
                        Capsule()
                            .fill(Color.orange)
                            .frame(height: 4)
                        
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 34, height: 34)
                            .overlay {
                                Text("3")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                    }
                    
                    HStack {
                        Text("Details")
                            .foregroundStyle(Color.orange)
                        Spacer()
                        Text("Review")
                            .foregroundStyle(Color.orange)
                        Spacer()
                        Text("Publish")
                            .foregroundStyle(Color.orange)
                    }
                    .font(.caption.bold())
                }
                
                Spacer()
                
                // MARK: - Success Icon
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 85))
                    .foregroundStyle(Color.orange)
                
                VStack(spacing: 10) {
                    Text("Ready to Publish?")
                        .font(.title.bold())
                        .foregroundStyle(Color.color)
                    
                    Text("Your item is ready to be listed on CampusBuddy Marketplace.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 24)
                }
                
                // MARK: - Item Summary Box
                VStack(spacing: 8) {
                    Text(itemName)
                        .font(.headline.bold())
                        .foregroundStyle(Color.color)
                    
                    Text("RM \(price) • \(condition)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(color: .black.opacity(0.05), radius: 4)
                
                Spacer()
                
                Button {
                    published = true
                } label: {
                    Text("Publish Item")
                        .font(.headline.bold())
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                }
            }
            .padding(.horizontal, 18)
            .padding(.bottom, 20)
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .alert("Item Published!", isPresented: $published) {
            Button("Go to Marketplace") {
                NotificationCenter.default.post(name: NSNotification.Name("PopToHomeRoot"), object: nil)
                dismiss()
            }
        } message: {
            Text("Your item is now live and available on CampusBuddy Marketplace.")
        }
    }
}

#Preview {
    SellItemPublishView(
        itemName: "Engineering Mathematics Textbook",
        description: "Good condition",
        price: "20",
        condition: "Good"
    )
}
