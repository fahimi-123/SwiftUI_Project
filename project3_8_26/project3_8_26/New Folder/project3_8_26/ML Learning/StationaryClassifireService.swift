//
//  StationaryClassifireService.swift
//  project3_8_26
//
//  Created by STDC_45 on 10/08/2026.
//

import UIKit
import CoreML
import Vision

struct StationaryPrediction {
    let Stationary: String
    let confidence: Double
}

struct StationaryClassifierService {
    
    func classify(
        image: UIImage,
        completion: @escaping (StationaryPrediction?) -> Void
    ) {
        
        guard let cgImage = image.cgImage else {
            completion(nil)
            return
        }
        
        do {
            
            // Load Core ML model
            let configuration = MLModelConfiguration()
            
            let coreMLModel = try MyStationaryClassML(
                configuration: configuration
            ).model
            
            // Convert Core ML model to Vision model
            let visionModel = try VNCoreMLModel(
                for: coreMLModel
            )
            
            // Create classification request
            let request = VNCoreMLRequest(
                model: visionModel
            ) { request, error in
                
                guard error == nil else {
                    print("Prediction error:", error!)
                    completion(nil)
                    return
                }
                
                guard let results =
                        request.results
                        as? [VNClassificationObservation],
                      let firstResult = results.first
                else {
                    completion(nil)
                    return
                }
                
                let prediction = StationaryPrediction(
                    Stationary: firstResult.identifier,
                    confidence: Double(firstResult.confidence)
                )
                
                DispatchQueue.main.async {
                    completion(prediction)
                }
            }
            
            request.imageCropAndScaleOption = .centerCrop
            
            // Send image to Vision
            let handler = VNImageRequestHandler(
                cgImage: cgImage
            )
            
            DispatchQueue.global(
                qos: .userInitiated
            ).async {
                
                do {
                    try handler.perform([request])
                } catch {
                    print(
                        "Unable to classify image:",
                        error
                    )
                    
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            }
            
        } catch {
            print(
                "Unable to load ML model:",
                error
            )
            
            completion(nil)
        }
    }
}
