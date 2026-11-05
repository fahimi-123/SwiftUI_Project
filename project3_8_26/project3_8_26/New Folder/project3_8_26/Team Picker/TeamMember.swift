//
//  TeamMember.swift
//  project3_8_26
//
//  Created by STDC_45 on 05/08/2026.
//

import SwiftUI

struct TeamMember {
    let name : String
    let imageName : String
    
    
}

struct TeamAssignment {
    let member: TeamMember
    let role: String
    
    
}



struct PaparanBaru: View {
    
    @State private var assignments: [TeamAssignment]=[]
    
    let members = [
        TeamMember(name: "Fahimi", imageName: "FahimiPhoto"),
        TeamMember(name: "Kimi", imageName: "KimiPhoto"),
        TeamMember(name: "Nadia", imageName: "NadiaPhoto"),
        TeamMember(name: "Afiqah", imageName: "AfiqahPhoto"),
        TeamMember(name: "Hana", imageName: "HanaPhoto"),
        TeamMember(name: "Nazmi", imageName: "NazmiPhoto"),
    ]
    
    let roles = [
        "Developer",
        "UI designer",
        "Present",
        "Researcher",
        "Presenter",
        "haluuu"
        
    ]
    
    var body: some View {
        
        VStack {
            Text("Random Team Picker")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            
            ScrollView{
                
                VStack{
                    ForEach(
                        assignments.indices,
                        id: \.self
                    ) { index in
                        RandomMemberView(
                            pickerNumber: index + 1,
                            assignment: assignments[index])
                    }
                }
                HStack{
                    Button(
                        "ADD Assignment",
                        systemImage:  "person.crop.circle.fill.badge.plus"){
                            withAnimation {
                                tambahRandom()
                            }
                        }
                        .disabled(assignments.count >= members.count || assignments.count >= roles.count)
                    
                    Button(
                        "Remove",
                        systemImage: "person.crop.circle.fill.badge.minus"){
                            withAnimation {
                                buangLast()
                            }
                        }
                        .disabled(assignments.isEmpty)
                }
                .labelStyle(.iconOnly)
                .font(.largeTitle)
                
                Button("Reset All",
                       systemImage:  "trash.slash.circle.fill"){
                    
                    withAnimation {
                        assignments.removeAll()
                    }
                }
                       .labelStyle(.iconOnly)
                       .font(.largeTitle)
                
            }

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mint.gradient)
        .tint(.white)
    }
    func tambahRandom(){
        let usedNames = assignments.map{
            
            $0.member.name
        }
        let usedRoles = assignments.map{
            
            $0.role
        }
        
        let availabalemember = members.filter{
            
            !usedNames.contains($0.name)
        }
        
        let availabalerole = roles.filter{
            
            !usedRoles.contains($0)
        }
        
        guard
            let randomMember = availabalemember.randomElement(),
            let randomRole = availabalerole.randomElement()
        else{
            return
        }
        
        let newAssignment = TeamAssignment(member: randomMember, role: randomRole)
        assignments.append(newAssignment)
    }
    
    func buangLast(){
        guard !assignments.isEmpty else{
            return
        }
        assignments.removeLast()
        
    }
    
    }

#Preview {
    PaparanBaru()
}

