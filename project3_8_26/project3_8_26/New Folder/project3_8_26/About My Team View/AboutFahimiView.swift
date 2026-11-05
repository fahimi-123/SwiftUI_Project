//
//  AboutFahimiView.swift
//  MyTeamApp
//
//  Created by STDC_36 on 03/08/2026.
//

import SwiftUI

struct AboutFahimiView: View {
    var body: some View {
        NavigationStack{
            HStack {
                Image("FahimiPhoto")
                    .resizable()
                    .frame(width:65, height:65)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.white, lineWidth: 5)
                    }
                    .shadow(radius:10)
                
                VStack{
                    Text("Fahimi")
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.yellow)
                        .frame(maxWidth: .infinity, alignment:.leading)
                    
                    Text("UPSI")
                        .foregroundStyle(Color.yellow)
                        .frame(maxWidth: .infinity, alignment:.trailing)
                    
                    NavigationLink("haluuu"){
                        MyTeamInfoNew()
                    }
                }

            }
            .padding()
            .background(Color.purple)
        }
    }
}

#Preview {
    AboutFahimiView()
}
