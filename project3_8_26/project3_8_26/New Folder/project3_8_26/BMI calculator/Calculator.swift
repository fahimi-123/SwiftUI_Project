//
//  Calculator.swift
//  project3_8_26
//
//  Created by STDC_45 on 06/08/2026.
//

import SwiftUI

struct Calculator: View {
    
    @State private var beratString = ""
    @State private var tinggiString = ""
    @State private var classString = "Classification"
    @State private var bmiResultString = "BMI result"
    var body: some View {
        
        
        VStack {
            
            HStack{
                Text("Height")
                TextField("m", text: $tinggiString)
                    .border(.black)
            }
            
            HStack{
                Text("Weight")
                TextField("Kg", text: $beratString)
                    .border(.black)
            }
            
            Button("Calculate BMI"){
                
                
                
                
                
                
                if let berat = Double(beratString), let tinggi = Double(tinggiString), berat > 0, tinggi > 0{
                    
                    let bmiResult = berat / (tinggi * tinggi)
                    
                    
                    classString = getClassification(bmiResult: bmiResult)
                   
                    bmiResultString = String((bmiResult*10).rounded()/10)
                    
                }
                
                else{
                    
                    classString="Error"
                    bmiResultString="Error"
                }
                
                
                
               // print(bmiResultString)
               // print("Result: " + classString)
                
                
            }
           // .border(.purple)
            .padding()
            .buttonStyle(.borderedProminent)
            .padding()
            
            Text(bmiResultString)
                .font(.largeTitle)
            ClassificationView(classString: $classString)
        }
        .padding()
        
    }
}

#Preview {
    Calculator()
}
