//
//  MyTeamList.swift
//  project3_8_26
//
//  Created by STDC_45 on 07/08/2026.
//

import SwiftUI

struct MyTeamList: View {
    
    @State private var nama : [String] = []
    
    @State private var addNama = ""
    @State private var pickedName = ""
    @State private var tolongBuangIni = false
    

    
    var body: some View {
        VStack{

            VStack(spacing: 8){
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.blue)
                    .symbolRenderingMode(.hierarchical)
                Text("Majuuu")
                
            }
            .font(.largeTitle)
            .bold()
            
            Text(pickedName.isEmpty ? "": pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List{
                ForEach(nama, id: \.description){
                    
                    namas in
                    
                    Text(namas)
                        .font(.title3)
                    
                        .swipeActions(edge: .trailing){
                            Button(role: .destructive){
                                deleteNama(namas)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    
                        .swipeActions(edge: .leading){
                            Button{
                                print("\(namas) selected")
                            } label: {
                                Label("Selected", systemImage: "checkmark")
                            }
                            .tint(.green)
                        }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Tambah Nama", text: $addNama)
                .autocorrectionDisabled()
                .onSubmit {
                    if !addNama.isEmpty{
                        nama.append(addNama)
                        addNama = ""
                    }
                }
                .padding()
                .border(Color.black, width: 2)
                
            Divider()
            
            Toggle("Buang Bila Dipilih", isOn: $tolongBuangIni)
            
            Button{
                
                if let randomName = nama.randomElement(){
                    
                    pickedName = randomName
                    
                    if tolongBuangIni {
                        
                        nama.removeAll{
                            namas in
                            return(namas == randomName)
                        }
                    }
                }
                else{
                    
                    pickedName = ""
                }
            }
            label:{
                
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
    
    func deleteNama(_ student: String){
        
        nama.removeAll(){
            $0 == student
        }
    }
    
}

#Preview {
    MyTeamList()
}
