////
////  imageView.swift
////  Earn it practice
////
////  Created by Mohamed Midani on 1/24/24.
////
//
//import SwiftUI
//
//struct imageView: View {
//    var image: String
//    var body: some View {
//        AsyncImage(url: URL(string: image)) { phase in
//            if let image = phase.image {
//                image
//                    .resizable()
//                    .scaledToFit()
//            } else if phase.error != nil {
//                Text("There was an error loading the image.")
//            } else {
//                ProgressView()
//            }
//        }
//        .frame(width: 200, height: 200)    }
//}
//
//#Preview {
//    imageView()
//}
