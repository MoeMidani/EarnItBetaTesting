//
//  ContentView.swift
//  Earn it practice
//
//  Created by Mohamed Midani on 1/21/24.
//

import SwiftUI
import UIKit
import SwiftSoup


struct ContentView: View {
    
    
    
    

    @State private var urlText: String = ""
    @State var isValidLink : Bool = false
    @State var imgUrl : String = ""
    var body: some View {
        
        VStack {
            TextField("Enter URL", text: $urlText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button(action: {
                if var urlLink = URL(string: urlText), UIApplication.shared.canOpenURL(urlLink) {
                     imgUrl = getProductImage(url: urlLink)
//                    urlLink = URL(string: "Empty") ?? URL(string: "Empty")!
                    isValidLink = true
                     
                } else {
                    Text("Invalid URL")
                        .foregroundColor(.red)
                }
    
    
            }) {
                   Text("Render Image")
                     .font(.caption)
                 }
            if (isValidLink){
                AsyncImage(url: URL(string: imgUrl)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } else if phase.error != nil {
                                    Text("There was an error loading the image.")
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: 200, height: 200)
                        }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
                        if let urlLink = URL(string: urlText), UIApplication.shared.canOpenURL(urlLink) {
//,                            // Use the UIViewControllerRepresentable to embed your ViewController
            //                ImageLoaderView(url: urlLink)
            //                let imgUrl = getProductImage(url: url)
            
            
            
            
            
                        } else {
                            Text("Invalid URL")
                                .foregroundColor(.red)
                        }
            
            
                    }
            
        }
//        var imgUrl = getProductImage(url: urlLink!)
//        if (isValidLink){
//            AsyncImage(url: URL(string: imgURL)) { phase in
//                if let image = phase.image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                } else if phase.error != nil {
//                    Text("There was an error loading the image.")
//                } else {
//                    ProgressView()
//                }
//            }
//            .frame(width: 200, height: 200)
//        }
        
        
      
    }








#Preview {
    ContentView()
}


