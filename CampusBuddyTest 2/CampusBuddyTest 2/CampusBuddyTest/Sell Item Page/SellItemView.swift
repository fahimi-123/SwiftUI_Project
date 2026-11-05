//
//  SellItemView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 09/08/2026.
//

import SwiftUI
import PhotosUI
import UIKit

struct SellItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Form Data
    @State private var itemName = ""
    @State private var description = ""
    @State private var price = ""
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedImage: UIImage?
    @State private var isShowingCamera = false
    
    let conditions = ["New", "Like New", "Good", "Fair"]
    @State private var selectedCondition = "New"
    
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
                        
                        Text("Sell Item")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(Color.color)
                        
                        Spacer()
                        
                        Color.clear
                            .frame(width: 38, height: 38)
                    }
                    .padding(.top, 4)
                    
                    
                    // MARK: - Progress Indicator
                    VStack(spacing: 8) {
                        HStack {
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 34, height: 34)
                                .overlay {
                                    Text("1")
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                            
                            Capsule()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 4)
                            
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 34, height: 34)
                                .overlay {
                                    Text("2")
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
                                .foregroundStyle(Color.orange)
                            Spacer()
                            Text("Review")
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("Publish")
                                .foregroundStyle(.gray)
                        }
                        .font(.caption.bold())
                    }
                    
                    
                    // MARK: - Banner
                    LinearGradient(
                        colors: [.orange, .yellow],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Sell Your Item")
                                .font(.system(size: 24, weight: .bold))
                            
                            Text("Reach hundreds of students around your campus.")
                                .font(.subheadline)
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 22)
                    }
                    .shadow(color: .black.opacity(0.08), radius: 6, y: 3)
                    
                    
                    // MARK: - Photos Picker
                    VStack(spacing: 12) {
                        ZStack(alignment: .bottomTrailing) {
                            if let selectedImage {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 280, height: 240)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            } else {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.gray.opacity(0.10))
                                    .frame(width: 280, height: 240)
                                    .overlay {
                                        VStack(spacing: 10) {
                                            Image(systemName: "photo.on.rectangle.angled")
                                                .font(.system(size: 42))
                                                .foregroundStyle(Color.orange)
                                            
                                            Text("Add a photo")
                                                .font(.headline)
                                            
                                            Text("Upload or take a photo")
                                                .font(.caption)
                                                .foregroundStyle(.secondary)
                                        }
                                    }
                            }
                            
                            Button {
                                isShowingCamera = true
                            } label: {
                                Image(systemName: "camera.fill")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .frame(width: 44, height: 44)
                                    .background(Color.orange)
                                    .clipShape(Circle())
                            }
                            .padding(10)
                        }
                        
                        HStack(spacing: 10) {
                            PhotosPicker(
                                selection: $selectedPhoto,
                                matching: .images
                            ) {
                                HStack(spacing: 8) {
                                    Image(systemName: "photo.on.rectangle")
                                    Text("Choose Photo")
                                        .fontWeight(.semibold)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.orange)
                            .onChange(of: selectedPhoto) { _, _ in
                                loadSelectedPhoto()
                            }
                            
                            Button {
                                isShowingCamera = true
                            } label: {
                                HStack(spacing: 8) {
                                    Image(systemName: "camera")
                                    Text("Camera")
                                        .fontWeight(.semibold)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                            }
                            .buttonStyle(.bordered)
                            .tint(.orange)
                        }
                    }
                    .sheet(isPresented: $isShowingCamera) {
                        CameraPicker(selectedImage: $selectedImage)
                            .ignoresSafeArea()
                    }
                    
                    
                    // MARK: - Item Details Fields
                    CustomField(
                        title: "Item Name",
                        placeholder: "Engineering Mathematics Textbook",
                        text: $itemName
                    )
                    
                    // Condition Selector
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Condition")
                            .font(.headline.bold())
                            .foregroundStyle(Color.color)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(conditions, id: \.self) { condition in
                                    Button {
                                        selectedCondition = condition
                                    } label: {
                                        Text(condition)
                                            .font(.subheadline.bold())
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 9)
                                            .background(selectedCondition == condition ? Color.orange : Color.white)
                                            .foregroundStyle(selectedCondition == condition ? .white : .primary)
                                            .clipShape(Capsule())
                                    }
                                }
                            }
                        }
                    }
                    
                    // Description Input
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .font(.headline.bold())
                            .foregroundStyle(Color.color)
                        
                        TextEditor(text: $description)
                            .frame(height: 120)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .shadow(color: .black.opacity(0.05), radius: 4)
                    }
                    
                    CustomField(
                        title: "Price",
                        placeholder: "RM 20",
                        text: $price
                    )
                    
                    Spacer(minLength: 60)
                }
                .padding(.horizontal, 18)
            }
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        
        // MARK: - Bottom Action Button
        .safeAreaInset(edge: .bottom) {
            let canContinue = selectedImage != nil && !itemName.isEmpty && !description.isEmpty && !price.isEmpty
            
            NavigationLink {
                SellItemReviewView(
                    itemName: itemName,
                    description: description,
                    price: price,
                    condition: selectedCondition,
                    selectedImage: selectedImage
                )
            } label: {
                Text("Next: Review Item")
                    .font(.headline.bold())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(canContinue ? Color.orange : Color.gray.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 18))
            }
            .disabled(!canContinue)
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
    
    private func loadSelectedPhoto() {
        Task {
            guard let selectedPhoto else { return }
            do {
                if let imageData = try await selectedPhoto.loadTransferable(type: Data.self) {
                    selectedImage = UIImage(data: imageData)
                }
            } catch {
                print("Unable to load photo: \(error)")
            }
        }
    }
}

#Preview {
    SellItemView()
}
