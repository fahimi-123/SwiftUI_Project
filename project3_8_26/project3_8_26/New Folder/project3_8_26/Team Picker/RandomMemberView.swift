//
//  RandomMemberView.swift
//  project3_8_26
//
//  Created by STDC_45 on 05/08/2026.
//

import SwiftUI

struct RandomMemberView: View {
    
    let pickerNumber : Int
    let assignment : TeamAssignment
    
    var body: some View {
        
        
      
            VStack {
                Text("Picker \(pickerNumber)")
                    .font(.headline)
                    
                
                Image(assignment.member.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 100)
                    .clipShape(Circle())
                
                Text(assignment.member.name)
                    .font(.title)
                    .italic()
                    .underline()
                
                Text(assignment.role)
                    .font(.title)
                
            
        }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.5))
            .cornerRadius(20)
            .shadow(radius: 5)
            

    }
}

#Preview {
    PaparanBaru()
}
