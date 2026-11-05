//
//  AboutAllView.swift
//  MyTeamApp
//
//  Created by STDC_36 on 03/08/2026.
//

import SwiftUI

struct AboutAllView2: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("Meet My Team!💎")
                    .font(.largeTitle)
                    .bold()
                
                AboutNadiaView()
                AboutAfiqahView()
                AboutFahimiView()
                AboutKimiView()
                AboutHanaView()
                AboutNazmiView()
            }
        }
    }
}

#Preview {
    AboutAllView2()
}
