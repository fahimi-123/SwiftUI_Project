//
//  AboutHanaView.swift
//  MyTeamApp
//
//  Created by STDC_36 on 03/08/2026.
//

import SwiftUI

struct AboutHanaView: View {
    var body: some View {
        HStack {
            Image("HanaPhoto")
                .resizable()
                .frame(width:65, height:65)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.white, lineWidth: 5)
                }
                .shadow(radius:10)
            
            VStack{
                Text("Hana")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color.yellow)
                    .frame(maxWidth: .infinity, alignment:.leading)
                
                Text("STDC KUALA SELANGOR")
                    .foregroundStyle(Color.yellow)
                    .frame(maxWidth: .infinity, alignment:.trailing)
            }
            
        }
        .padding()
        .background(Color.purple)
    }
}

#Preview {
    AboutHanaView()
}
