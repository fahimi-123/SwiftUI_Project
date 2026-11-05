//
//  OroraView.swift
//  MyTeamApp
//
//  Created by STDC_36 on 03/08/2026.
//

import SwiftUI

struct OroraView: View {
    var body: some View {
        VStack {
            Image("NadiaPhoto")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.purple, lineWidth: 5)
            
                }
                .shadow(radius:10)
            Text("Nadia")
                .font(.title)
                //.padding()
                .bold()
                .foregroundStyle(Color.purple)
            
            Text("UPSI , TM")
                .font(.title2)
                .padding()
                .bold()
                .foregroundStyle(Color.purple)

            
            HStack{
                Text("01137812064")
                    .foregroundStyle(Color.white)

                Spacer()
                    .frame(width:30)
                Text("Perak, MY")
                    .foregroundStyle(Color.white)

                
            }
            Divider()
            
            Text("About Me")
                .font(.title2)
                .bold()
                .foregroundStyle(Color.purple)

            
            Text("Sakeding Sakeding AAA AAAA")
                .foregroundStyle(Color.white)
            
            Text("Pakdunding Dung Pakdungking ")
                .foregroundStyle(Color.white)

            
            Spacer()
        }
        .padding()
        .background(Color.black)
    }
}

#Preview {
    OroraView()
}
