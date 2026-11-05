//
//  MyTeamPicker.swift
//  project3_8_26
//
//  Created by STDC_45 on 05/08/2026.
//

import SwiftUI

struct MyTeamPicker: View {
    
    
   @State private var selectedmember = 1
    
    var namaMember : String {
        if selectedmember == 1{
            return "Fahimi"
        }else if selectedmember == 2{
            return "Kimi"
        }else if selectedmember == 3{
            return "Nadia"
        } else if selectedmember == 4{
            return "Afiqah"
        }else if selectedmember == 5{
            return "Hana"
        }else {
            return "Nazmi"
        }
    }
     
     var ImageMember : String {
         if selectedmember == 1{
             return "FahimiPhoto"
         }else if selectedmember == 2{
             return "KimiPhoto"
         }else if selectedmember == 3{
             return "NadiaPhoto"
         } else if selectedmember == 4{
             return "AfiqahPhoto"
         }else if selectedmember == 5{
             return "HanaPhoto"
         }else {
             return "NazmiPhoto"
         }
     }
    
    var RoleMember : String {
        if selectedmember == 1{
            return "Developer"
        }else if selectedmember == 2{
            return "Developer"
        }else if selectedmember == 3{
            return "UI Designer"
        } else if selectedmember == 4{
            return "UI Designer"
        }else if selectedmember == 5{
            return "UI Designer"
        }else {
            return "STDCx"
        }
    }
    

    
    var body: some View {
        
        VStack {
            Image(ImageMember)
                .resizable()
                .scaledToFill()
                .frame(width: 120,height: 120)
                .clipShape(.circle)
            
            Text(namaMember)
                .font(.title2)
                .bold()
            
            Text(RoleMember)
                .foregroundStyle(.secondary)
            
            Button("Pilih member"){
                
                selectedmember=Int.random(in: 1...6)
                
                print(selectedmember)
                
            }
            
        }
        
    }
}






#Preview {
    MyTeamPicker()
}
