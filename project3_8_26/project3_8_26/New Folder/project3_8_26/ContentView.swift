//
//  ContentView.swift
//  project3_8_26
//
//  Created by STDC_45 on 03/08/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
                Text("Hello Fahimi")
                    .padding()
                .background(Color.cyan, in : RoundedRectangle(cornerRadius: 12))
            
            Text("UPSI")
                .padding()
                .background(Color.mint, in: RoundedRectangle(cornerRadius: 12))
            
            
        }
        .padding()
        
        
        
    }
}

#Preview {
    ContentView()
}
