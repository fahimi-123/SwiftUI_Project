//
//  MyTeamInfoNew.swift
//  project3_8_26
//
//  Created by STDC_45 on 04/08/2026.
//

import SwiftUI

struct MyTeamInfoNew: View {
    var body: some View {
        ZStack {
            Color.gradientTwo
                .ignoresSafeArea()
            VStack{
                
                VStack (spacing: 8){
                    
                    Text("My Team")
                        .italic()
                        .bold()
                        .font(.title)
                        .underline()
                    
                    Text("Team Diamond")
                        .font(.title2)
                    
                    Text("Dont Think Just Do")
                        .font(.title3)
                    
                }
                .padding()
                ScrollView(.vertical){
                VStack {
                    ScrollView(.horizontal){
                        
                        HStack{
                            
                            VStack(spacing: 5){
                                
                                Image(systemName: "warninglight.fill")
                                    .font(.system(size: 45))
                                    .frame(width: 80,height: 80)
                                    .background(.green)
                                    .clipShape(.circle)
                                
                                
                                Text("Fahimi")
                                    .font(.headline)
                                
                                Text("test")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                
                            }
                            .padding()
                            .frame(width: 150)
                            .background(.gradientOne.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            VStack(spacing: 5){
                                
                                Image(systemName: "chevron.left.forwardslash.chevron.right")
                                    .font(.system(size: 45))
                                    .frame(width: 80,height: 80)
                                    .background(.green)
                                    .clipShape(.circle)
                                
                                
                                Text("Fahimi")
                                    .font(.headline)
                                
                                Text("test")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                
                            }
                            .padding()
                            .frame(width: 150)
                            .background(.gradientOne.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            VStack(spacing: 5){
                                
                                Image(systemName: "warninglight.fill")
                                    .font(.system(size: 45))
                                    .frame(width: 80,height: 80)
                                    .background(.green)
                                    .clipShape(.circle)
                                
                                
                                Text("Fahimi")
                                    .font(.headline)
                                
                                Text("test")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                
                            }
                            .padding()
                            .frame(width: 150)
                            .background(.gradientOne.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            VStack(spacing: 5){
                                
                                Image(systemName: "warninglight.fill")
                                    .font(.system(size: 45))
                                    .frame(width: 80,height: 80)
                                    .background(.green)
                                    .clipShape(.circle)
                                
                                
                                Text("Fahimi")
                                    .font(.headline)
                                
                                Text("test")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                
                            }
                            .padding()
                            .frame(width: 150)
                            .background(.gradientOne.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            
                            VStack(spacing: 5){
                                
                                Image(systemName: "warninglight.fill")
                                    .font(.system(size: 45))
                                    .frame(width: 80,height: 80)
                                    .background(.green)
                                    .clipShape(.circle)
                                
                                
                                Text("Fahimi")
                                    .font(.headline)
                                
                                Text("test")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                
                            }
                            .padding()
                            .frame(width: 150)
                            .background(.gradientOne.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                        }
                    }
                    
                    .scrollIndicators(.hidden)
                    
                    ScrollView(.horizontal){
                        HStack{
                            
                            TeammemberView(nama: "kamarul", tilte: "test")
                            TeammemberView(nama: "fahimi", tilte: "test")
                            TeammemberView(nama: "saiful", tilte: "test")
                            TeammemberView(nama: "test", tilte: "test")
                            TeammemberView(nama: "test_1", tilte: "test")
                            
                                .padding()
                                .frame(width: 150)
                                .background(.gradientOne.opacity(0.7))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            
                        }
                    }
                }
                    .scrollIndicators(.hidden)
                
            }
            .padding()
        }
        
    }
        
    
}








struct TeammemberView: View{
    
    let nama: String
    let tilte: String
    @State private var testanimation = false
    
    var body: some View{
        
        VStack(spacing: 5){
            
            Image(systemName: "warninglight.fill")
                .font(.system(size: 45))
                .frame(width: 80,height: 80)
                .background(testanimation ? .gradientOne.opacity(0.7):.green)
                .clipShape(.circle)
            
                .onTapGesture {
                    withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                        testanimation.toggle()
                    }
                }
            
            Text(nama)
                .font(.headline)
            
            Text(tilte)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
        }
        .padding()
        .frame(width: 150)
        .background(.gradientOne.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
    }
    
}

#Preview {
    MyTeamInfoNew()
}
