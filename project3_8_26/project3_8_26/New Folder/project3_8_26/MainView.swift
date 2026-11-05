//
//  MainView.swift
//  project3_8_26
//
//  Created by STDC_45 on 03/08/2026.
//

import SwiftUI

struct MainView: View {
 
    var body: some View {
        
        NavigationStack {
            TabView{
                
                ContentView()
                    .tabItem{
                        Label("Community", systemImage: "person.3.fill")
                        
                        
                    }
                FahimiView()
                    .tabItem{
                        Label("Home", systemImage: "house.fill")
                        
                    }
                AboutAllView2()
                    .tabItem{
                        Label("About", systemImage: "globe.fill")
                        
                    }
                Calculator()
                    .tabItem{
                        Label("Info", systemImage: "bell")
                        
                    }
                PaparanBaru()
                    .tabItem{
                        Label("random", systemImage: "person.2")
                        
                    }
                /* MapView()
                 .tabItem{
                 Label("Map", systemImage: "map.circle.fill")
                 
                 }*/
                
                
            }
            
            .toolbar{
                
                ToolbarItem(placement: .topBarTrailing){
                    
                    NavigationLink(destination: MapView()){
                        
                        Image(systemName: "map.circle.fill")
                    }
                }
            }
            
        }
        
        
        
    }
}

#Preview {
    MainView()
}
