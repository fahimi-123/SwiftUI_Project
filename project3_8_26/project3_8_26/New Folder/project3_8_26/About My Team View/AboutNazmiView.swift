//
//  AboutNazmiView.swift
//  MyTeamApp
//
//  Created by STDC_36 on 04/08/2026.
//

import SwiftUI

struct AboutNazmiView: View {
    var body: some View {
        HStack {
            Image("NazmiPhoto")
                .resizable()
                .frame(width:65, height:65)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.white, lineWidth: 5)
                }
                .shadow(radius:10)
            
            VStack{
                Text("Nazmi")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.yellow)
                    .frame(maxWidth: .infinity, alignment:.leading)
                
                Text("Apple Trainer STDCx")
                    .foregroundStyle(Color.yellow)
                    .frame(maxWidth: .infinity, alignment:.trailing)
            }
            
        }
        .padding()
        .background(Color.brown)
    }
}

#Preview {
    AboutNazmiView()
}
