//
//  EnterCoordView.swift
//  project3_8_26
//
//  Created by STDC_45 on 07/08/2026.
//

import SwiftUI
import MapKit

struct EnterCoordView: View {
    
    @Binding var location: CLLocationCoordinate2D
    @Binding var showingSheet: Bool
    //@State private var latString = ""
    //@State private var longString = ""
    @AppStorage("latString") private var latString = ""
    @AppStorage("longString") private var longString = ""
    
    var body: some View {
        
        VStack{
            
            HStack{
                Text("Latitude")
                TextField("Latitude", text: $latString)
                
            }
            HStack{
                
                Text("Longtitude")
                TextField("Longtitude", text: $longString)
            }
            
            Button("Apply"){
                guard let lat = CLLocationDegrees(latString), let long = CLLocationDegrees(longString)
                else{
                    return
                }
                
                location = CLLocationCoordinate2D(latitude: lat, longitude: long)
                showingSheet = false
                
            }
            
        }
        .padding()
    }
}

#Preview {
    EnterCoordView(location: .constant(CLLocationCoordinate2D()), showingSheet: .constant(false))
}
