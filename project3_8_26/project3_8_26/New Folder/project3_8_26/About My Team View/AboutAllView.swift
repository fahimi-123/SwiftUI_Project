//
//  AboutAllView.swift
//  MyTeamApp
//
//  Created by STDC_36 on 03/08/2026.
//

import SwiftUI

struct AboutAllView: View {
    var body: some View {
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

#Preview {
    AboutAllView()
}
