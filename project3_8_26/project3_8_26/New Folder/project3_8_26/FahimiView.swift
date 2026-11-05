//
//  SecondView.swift
//  project3_8_26
//
//  Created by STDC_45 on 03/08/2026.
//

import SwiftUI

let gradientWarna: [Color] = [.gradientOne, .gradientTwo]

struct FahimiView: View {
    @State private var animation = false
    
    var body: some View {
        ZStack{
            //Color.brown
            //.ignoresSafeArea()
            
            VStack{
                
                Image("FahimiPhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .rotationEffect(.degrees(animation ? 360 : 0))
                    .overlay{
                        Circle().stroke(.black, lineWidth: 5)
                        
                    }
                    .shadow(radius: 30)
                
                
                    .onTapGesture {
                        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                            animation.toggle()
                        }
                    }
                
                Text("Fahimi")
                    .font(.title)
                
                    .bold()
                Text("UPSI")
                    .font(.title2)
                    .padding()
                    .bold()
                
                HStack{
                    
                    
                    Text("0175683298")
                    Spacer()
                        .frame(width: 50)
                    Text("Perak, MY")
                    
                }
                Divider()
                    .background(Color.black)
                    .padding()
                
                
                
                Text("About Me :")
                Text("Who decide that?")
                
                Spacer()
                
            }
            .padding()
            .background(Gradient(colors: gradientWarna))
            

        }
    }
}

#Preview {
    FahimiView()
}
