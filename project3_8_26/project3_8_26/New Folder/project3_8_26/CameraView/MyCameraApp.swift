//
//  MyCameraApp.swift
//  CampusBuddy
//
//  Created by STDCX_MACBOOK PRO 10 on 07/08/2026.
//

import SwiftUI
import PhotosUI

struct MyCameraApp: View {
    
    @State private var selectedPhoto : PhotosPickerItem?
    @State private var selectedImage : UIImage?
    @State private var isShowingCamera = false
    
    private let classifire = StationaryClassifierService()
    
    @State private var prediction = "No Prediction"
    @State private var confidence = 0.0
    
    private var StationaryEmoji: String{
        
        switch prediction.lowercased(){
            
        case "pencil":
            return "✏️"
            
        case "pen":
            return "🖊️"
            
        case "eraser":
            return "✏️"
            
        case "Not Sure":
            return "😂"
            
        default:
            return "😳"
        }
    }
    
    var body: some View {
        VStack {
            
            Text("My Photo")
                .font(.largeTitle)
                .bold()
            
            Group {
                
                if let selectedImage {
                    Image( uiImage : selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300 , height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } else {
                    
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray.opacity(0.2))
                            .frame(width: 300,height: 300)
                        
                        Image(systemName: "photo")
                            .font(.system(size: 70))
                            .foregroundStyle(.gray)
                    }
                }
            }
            PhotosPicker( selection: $selectedPhoto,
                          matching: .images)
            {
                Label ("Choose Photo", systemImage: "photo.on.rectangle")
            }
            .buttonStyle (.borderedProminent)
            .onChange(of: selectedPhoto){
                loadSelectedPhoto()
            }
            .padding()
            
            Button{
                isShowingCamera = true
                
            }label: {
                Label("Take Photo", systemImage: "camera")
                
            }
            .buttonStyle(.bordered)
            
            Text(StationaryEmoji)
                .font(.system(size: 70))
                
            
            Text(prediction)
                .font(.title)
                .bold()
            
            Text("\(confidence * 100 , specifier: "%.1f")% Confidence")
            
            //Text("\((bmiResult*10).rounded()/10))")
            
            if selectedImage != nil{
                
                Button("Classify Image"){
                    
                    classifyImage()
                    
                }
                .buttonStyle(.borderedProminent)
            }
            
    }
        .padding()
        .sheet(isPresented: $isShowingCamera){
            CameraPicker(selectedImage: $selectedImage)
                .ignoresSafeArea()
        }

    }
    private func loadSelectedPhoto (){
        Task {
            guard let selectedPhoto else {
                return
            }
            
            do {
                if let imageData = try await
                    selectedPhoto.loadTransferable( type: Data.self
                    ){
                    selectedImage =  UIImage (data: imageData)
                }
            } catch {
                print ("Unable to load photo: \(error) ")
            }
        }
    }
    
    private func classifyImage() {
        
        guard let selectedImage else {
            return
        }
        
        classifire.classify(
            image: selectedImage
        ) { result in
            
            guard let result else {
                prediction = "Unable to identify"
                confidence = 0
                return
            }
            
            prediction = result.Stationary
            confidence = result.confidence
            
            if result.confidence < 0.60{
                
                prediction = "Not Sure"
            }
            else{
                
                prediction = result.Stationary
            }
        }
    }

}

#Preview {
    MyCameraApp()
}
