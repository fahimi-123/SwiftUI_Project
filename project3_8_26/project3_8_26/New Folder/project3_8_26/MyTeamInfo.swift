//
//  MyTeamInfo.swift
//  project3_8_26
//
//  Created by STDC_45 on 04/08/2026.
//

import SwiftUI

struct MyTeamInfo: View {
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
                }
                
            }
            .padding()
        }
        
    }
        
    
}

#Preview {
    MyTeamInfo()
}
