//
//  MarketplaceBanner.swift
//  CampusBuddyNew
//
//  Created by STDCX_MACBOOK PRO 10 on 09/08/2026.
//

import SwiftUI

struct MarketplaceBanner: View {
    
    var body: some View {
        NavigationStack{
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text("Buy. Sell.  Help a buddy.")
                        .font(.title2.bold())
                    
                    Text("Find great deals from\nstudents around you.")
                        .font(.subheadline)
                    
                    
                    NavigationLink {
                        SellItemView()
                    } label: {
                        
                        Text("Sell an Item")
                            .font(.subheadline.bold())
                            .foregroundColor(.white)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 10)
                            .background(Color.color)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    
                }
                
                Spacer()
                
                
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 65))
                    .foregroundColor(.orange)
                    .padding(.trailing, 10)
            }
            .padding(20)
            .frame(width: 375, height: 150)
            .background(
                LinearGradient(
                    colors: [
                        Color.orange.opacity(0.65),
                        Color.orange.opacity(0.45)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(
                color: .black.opacity(0.18),
                radius: 7,
                y: 4
            )
        }
    }
}
#Preview {
    MarketplaceBanner()
}
