//
//  MarketProductCard.swift
//  CampusBuddyNew
//
//  Created by STDCX_MACBOOK PRO 10 on 09/08/2026.
//

import SwiftUI

struct MarketProductCard: View {

    let imageName: String
    let title: String
    let price: String
    let location: String

    var body: some View {
      
        VStack(alignment: .leading, spacing: 8) {
            
            ZStack {

                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.15))

                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .padding(10)
            }
            .frame(height: 145)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(
                color: .black.opacity(0.12),
                radius: 5,
                y: 3
            )

         
            Text(title)
                .font(.subheadline.bold())
                .foregroundColor(.color)
                .lineLimit(2)
                .frame(height: 40, alignment: .top)

            
            Text(price)
                .font(.headline.bold())
                .foregroundColor(.orange)

    
            HStack(spacing: 4) {

                Text("📍")
                    .font(.caption)

                Text(location)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .lineLimit(1)
            }
        }
        .padding(10)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(
            color: .black.opacity(0.12),
            radius: 6,
            y: 3
        )
    }
}


