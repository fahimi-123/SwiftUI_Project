//
//  HelperMethod.swift
//  project3_8_26
//
//  Created by STDC_45 on 06/08/2026.
//

import Foundation

func getClassification (bmiResult: Double) -> String {
    
    var classString = ""
    
    switch bmiResult {
        
    case let bmiResult where bmiResult < 18.5:
        classString = "Underweight"
        
    case let bmiResult where bmiResult < 24.9:
        classString = "Normal"
        
    case let bmiResult where bmiResult < 30.5:
        classString = "Overweight"
        
    default:
        classString = "error"
        
    }
    
    return classString
}
