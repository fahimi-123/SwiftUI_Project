//
//  MapView.swift
//  project3_8_26
//
//  Created by STDC_45 on 07/08/2026.
//  3.685458, 101.524756

import SwiftUI
import MapKit

struct MapView: View {
    
  
    
    @State private var location = CLLocationCoordinate2D(latitude: 3.685458, longitude: 101.524756)
    
    @State private var showingSheet = false
    

    
    var body: some View {
            

            VStack {
                Map(bounds: MapCameraBounds(minimumDistance: 4500)){
                    
                    Marker("My Location", coordinate: location)
                    
                    
                }
                .border(Color.black, width: 2)
                Button("Enter coordinate"){
                    
                    showingSheet.toggle()
                }
                .padding()
                .background(Color.blue)
                .foregroundStyle(Color.mint)
                .sheet(isPresented: $showingSheet){
                    
                    //Text("Enter coordinate screen")
                    EnterCoordView(location: $location, showingSheet: $showingSheet)
                }
            }
            .padding()
            .shadow(radius: 20)
            
       
        
    }
}

#Preview {
    MapView()
}
