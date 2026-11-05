//
//  MarketPlaceView.swift
//  CampusBuddyTest
//
//  Created by STDCX_MACBOOK PRO 10 on 10/08/2026.
//

import SwiftUI

struct MarketItemModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let price: String
    let category: String
    let location: String
    let imageName: String
    let seller: String
    let sellerImage: String
}

struct MarketPlaceView: View {
    
    @ObservedObject var authManager = UserAuthManager.shared
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    
    @State private var selectedProduct: MarketItemModel? = nil
    @State private var showSellItemView = false
    
    let categories = ["All", "Textbooks", "Electronics", "Stationery", "Clothing", "Other"]
    
    let items = [
        MarketItemModel(
            title: "Casio Scientific Calculator FX-570EX",
            price: "RM45",
            category: "Electronics",
            location: "Kolej Harun Aminurrashid",
            imageName: "Calculator",
            seller: "Naz",
            sellerImage: "Naz"
        ),
        MarketItemModel(
            title: "Engineering Mathematics Textbook (3rd Ed)",
            price: "RM25",
            category: "Textbooks",
            location: "KSAS Main Library",
            imageName: "Note1",
            seller: "Syakir",
            sellerImage: "Syakir"
        ),
        MarketItemModel(
            title: "Lab Coat Size M (Barely Used)",
            price: "RM18",
            category: "Clothing",
            location: "Kolej Za'ba",
            imageName: "Lab Coat",
            seller: "Farah",
            sellerImage: "Farah"
        ),
        MarketItemModel(
            title: "Ergonomic Study Desk Lamp LED",
            price: "RM30",
            category: "Electronics",
            location: "Kolej Ungku Omar",
            imageName: "SubNote1",
            seller: "RosesFarhan",
            sellerImage: "RosesFarhan"
        ),
        MarketItemModel(
            title: "A4 Grid Notebook Set (3 Pack)",
            price: "RM12",
            category: "Stationery",
            location: "Kampus Sultan Abdul Jalil",
            imageName: "A4Notebook",
            seller: "Naz",
            sellerImage: "Naz"
        )
    ]
    
    var filteredItems: [MarketItemModel] {
        items.filter { item in
            let matchesSearch = searchText.isEmpty ||
            item.title.localizedCaseInsensitiveContains(searchText) ||
            item.location.localizedCaseInsensitiveContains(searchText)
            
            let matchesCategory = selectedCategory == "All" || item.category == selectedCategory
            
            return matchesSearch && matchesCategory
        }
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            // Split Background: Blue top for header curve visibility + White bottom for clean tab bar
            VStack(spacing: 0) {
                Color.color
                    .frame(height: 320)
                Color.white
            }
            .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    // MARK: - CENTERED APP LOGO HEADER
                    HStack {
                        Spacer()
                        
                        HStack(spacing: 0) {
                            Text("Campus")
                                .foregroundStyle(.white)
                            Text("Buddy")
                                .foregroundStyle(.orange)
                        }
                        .font(.system(size: 26, weight: .bold))
                        
                        Spacer()
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 16)
                    
                    
                    // MARK: - MARKETPLACE TITLE & SUBTITLE
                    VStack(alignment: .leading, spacing: 14) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Marketplace")
                                .font(.system(size: 28, weight: .bold))
                                .foregroundStyle(.white)
                            
                            Text("Buy & sell second-hand textbooks, electronics, and items.")
                                .font(.system(size: 13.5, weight: .regular))
                                .foregroundStyle(.white.opacity(0.9))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // MARK: - SEARCH BAR
                        HStack(spacing: 12) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(.gray)
                            
                            TextField("Search textbooks, gadgets, calculators....", text: $searchText)
                                .font(.system(size: 14))
                            
                            if !searchText.isEmpty {
                                Button {
                                    searchText = ""
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .frame(height: 48)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.1), radius: 6, y: 3)
                        .padding(.top, 4)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 22)
                    
                    
                    // MARK: - WHITE CONTENT SECTION (CURVED TOP SHAPE VISIBLE OVER BLUE)
                    VStack(spacing: 20) {
                        
                        // Category Horizontal Bar
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(categories, id: \.self) { cat in
                                    Button {
                                        selectedCategory = cat
                                    } label: {
                                        Text(cat)
                                            .font(.system(size: 13, weight: .semibold))
                                            .foregroundStyle(selectedCategory == cat ? .white : Color.color)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(selectedCategory == cat ? Color.color : Color.gray.opacity(0.08))
                                            .clipShape(Capsule())
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 24)
                        }
                        
                        // Section Header + 3 items + PLUS BUTTON BESIDE IT
                        HStack(alignment: .center) {
                            Text(searchText.isEmpty ? "Recent Listings" : "Search Results")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.color)
                            
                            Spacer()
                            
                            HStack(spacing: 8) {
                                Text("\(filteredItems.count) items")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundStyle(.orange)
                                
                                Button {
                                    if authManager.requireAuth(for: "selling items in marketplace") {
                                        showSellItemView = true
                                    }
                                } label: {
                                    Image(systemName: "plus")
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundStyle(.white)
                                        .frame(width: 26, height: 26)
                                        .background(Color.orange)
                                        .clipShape(Circle())
                                        .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        // Items List (Protected for Guest Mode)
                        VStack(spacing: 14) {
                            ForEach(filteredItems, id: \.title) { item in
                                Button {
                                    if authManager.requireAuth(for: "marketplace item details") {
                                        selectedProduct = item
                                    }
                                } label: {
                                    HStack(spacing: 14) {
                                        Image(item.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 75, height: 75)
                                            .padding(6)
                                            .background(Color.gray.opacity(0.08))
                                            .clipShape(RoundedRectangle(cornerRadius: 14))
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(item.title)
                                                .font(.system(size: 15, weight: .bold))
                                                .foregroundStyle(Color.color)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.leading)
                                            
                                            Text(item.price)
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundStyle(Color.orange)
                                            
                                            HStack(spacing: 4) {
                                                Image(systemName: "mappin.circle.fill")
                                                    .font(.system(size: 11))
                                                    .foregroundStyle(.gray)
                                                
                                                Text(item.location)
                                                    .font(.system(size: 11.5))
                                                    .foregroundStyle(.gray)
                                                
                                                Spacer()
                                                
                                                HStack(spacing: 4) {
                                                    Image(item.sellerImage)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 18, height: 18)
                                                        .clipShape(Circle())
                                                    
                                                    Text(item.seller)
                                                        .font(.system(size: 11.5, weight: .medium))
                                                        .foregroundStyle(.gray)
                                                }
                                            }
                                        }
                                        
                                        Spacer(minLength: 0)
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(12)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                                    .shadow(color: .black.opacity(0.06), radius: 5, x: 0, y: 2)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                                            .stroke(Color.gray.opacity(0.15), lineWidth: 1)
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        Spacer(minLength: 80)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 36,
                            topTrailingRadius: 36
                        )
                    )
                }
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $authManager.showAuthModal) {
            AuthRequiredModalSheet()
        }
        .navigationDestination(isPresented: $showSellItemView) {
            SellItemView()
        }
        .navigationDestination(item: $selectedProduct) { product in
            ProductDetailView(
                imageName: product.imageName,
                title: product.title,
                price: product.price,
                location: product.location,
                sellerName: product.seller,
                sellerImage: product.sellerImage
            )
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("PopToHomeRoot"))) { _ in
            showSellItemView = false
        }
    }
}

#Preview {
    MarketPlaceView()
}
