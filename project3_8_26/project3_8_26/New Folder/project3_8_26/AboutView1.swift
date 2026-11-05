//
//  AboutView.swift
//  project3_8_26
//
//  Created by STDC_45 on 03/08/2026.
//

import SwiftUI

struct AboutView1: View {
    @State private var animationsec = false
    var body: some View {
       // ScrollView(.horizontal){
        VStack{
            HStack{
                
                Image("Fahimi")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.black, lineWidth: 3)
                        
                    }
                    .shadow(radius: 30)
                    .offset(x: animationsec ? 310:0)
                
                    .onTapGesture {
                        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                            animationsec.toggle()
                        }
                    }
                
                Spacer()
                    .frame(width: 20)
                
                VStack{
                    Text("Fahimi")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(animationsec ? Color.cyan:Color.black)
                    
                    Text("Bukan orang sama")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .offset(x:-100 ,y:animationsec ? 0:90)
                        .foregroundStyle(animationsec ? Color.black:Color.white)
                    
                    
                    
                        .onTapGesture {
                            withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                                animationsec.toggle()
                            }
                        }
                }
                
            }
            .padding()
            .background(Color.cyan)
            
            
            HStack{
                
                Image("Kimi")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.black, lineWidth: 3)
                        
                    }
                    .shadow(radius: 30)
                    .offset(x: animationsec ? 0:310)
                
                    .onTapGesture {
                        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                            animationsec.toggle()
                        }
                    }
                
                Spacer()
                    .frame(width: 20)
                
                VStack{
                    Text("Kimi")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(animationsec ? Color.blue:Color.black)
                        .offset(x:-70)
                    
                    Text("Bukan orang sama")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .offset(x:10,y:animationsec ? 0:90)
                        .foregroundStyle(animationsec ? Color.black:Color.white)
                    
                    
                    
                        .onTapGesture {
                            withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                                animationsec.toggle()
                            }
                        }
                }
                
            }
            .padding()
            .background(Color.blue)
            
            
            
            HStack{
                
                Image("Afiqah")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.black, lineWidth: 3)
                        
                    }
                    .shadow(radius: 30)
                    .offset(x: animationsec ? 310:0)
                
                    .onTapGesture {
                        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                            animationsec.toggle()
                        }
                    }
                
                Spacer()
                    .frame(width: 20)
                
                VStack{
                    Text("Orang Orang")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(animationsec ? Color.cyan:Color.black)
                    
                    Text("Afiqah")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .offset(x:-100 ,y:animationsec ? 0:90)
                        .foregroundStyle(animationsec ? Color.black:Color.white)
                    
                    
                    
                        .onTapGesture {
                            withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                                animationsec.toggle()
                            }
                        }
                }
                
            }
            .padding()
            .background(Color.cyan)
            
            
            
            HStack{
                
                Image("Hana")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.black, lineWidth: 3)
                        
                    }
                    .shadow(radius: 30)
                    .offset(x: animationsec ? 0:310)
                
                    .onTapGesture {
                        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                            animationsec.toggle()
                        }
                    }
                
                Spacer()
                    .frame(width: 20)
                
                VStack{
                    Text("Hana")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(animationsec ? Color.blue:Color.black)
                        .offset(x:-70)
                    
                    Text("Bukan orang sama")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .offset(x:10,y:animationsec ? 0:90)
                        .foregroundStyle(animationsec ? Color.black:Color.white)
                    
                    
                    
                        .onTapGesture {
                            withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                                animationsec.toggle()
                            }
                        }
                }
                
            }
            .padding()
            .background(Color.blue)
            
            
            
            
            HStack{
                
                Image("Nadia")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.black, lineWidth: 3)
                        
                    }
                    .shadow(radius: 30)
                    .offset(x: animationsec ? 310:0)
                
                    .onTapGesture {
                        withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                            animationsec.toggle()
                        }
                    }
                
                Spacer()
                    .frame(width: 20)
                
                VStack{
                    Text("Nadia")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(animationsec ? Color.cyan:Color.black)
                    
                    Text("Bukan orang sama")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .offset(x:-100 ,y:animationsec ? 0:90)
                        .foregroundStyle(animationsec ? Color.black:Color.black)
                    
                    
                    
                        .onTapGesture {
                            withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 0)){
                                animationsec.toggle()
                            }
                        }
                }
                
            }
            .padding()
            .background(Color.cyan)
            
            }
        }
    }
    
//}
    
    
        


#Preview {
    AboutView1()
}
