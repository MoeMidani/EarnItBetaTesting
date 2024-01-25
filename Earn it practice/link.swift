//
//  link.swift
//  Earn it practice
//
//  Created by Mohamed Midani on 1/21/24.
//

import SwiftUI
import SwiftSoup
import UIKit


struct ImageLoaderView: UIViewControllerRepresentable {

    var url: URL

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = ImageLoaderViewController()
        viewController.url = url
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed
    }
}



//func getProductImage(url: URL)-> String{
////    print(url)
//    var result = ""
//    do {
//        let html = try String(contentsOf: url, encoding: .utf8)
//        let doc: Document = try SwiftSoup.parseBodyFragment(html)
//        let img: Element = try doc.select("li.image.item.itemNo0.maintain-height.selected img").first()!
//        let imgOuterHtml: String = try img.outerHtml();
//        let imgUrl = getImageUrl(imgOuterHtml)
//        result = imgUrl
//    }
//    catch {
//        print(error)
//    }
////    print(result)
//    return result
//    
//}
func getProductImage(url: URL, completion: @escaping (Result<String, Error>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }
        
        guard let data = data, let html = String(data: data, encoding: .utf8) else {
            completion(.failure(NSError(domain: "InvalidData", code: 0, userInfo: nil)))
            return
        }
        
        do {
            let doc: Document = try SwiftSoup.parseBodyFragment(html)
            let img: Element = try doc.select("li.image.item.itemNo0.maintain-height.selected img").first()!
            let imgOuterHtml: String = try img.outerHtml()
            let imgUrl = getImageUrl(imgOuterHtml)
            completion(.success(imgUrl))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}


private func loadImage(from url: URL) {
    
//       let imgUrl = getProductImage(url: url)
    
    getProductImage(url: url) { result in
        switch result {
        case .success(let imgUrl):
            print("Image URL: \(imgUrl)")
        case .failure(let error):
            print("Error: \(error)")
        }
    }
//    print(imgUrl)
    print("HERE")

    
       // Use imgUrl as needed, e.g., to display the image
       // Update your UI components here
   }

    
func getImageUrl(_ input: String)->String{
    let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
    let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
    
    guard let range = Range(matches[0].range, in: input) else { fatalError("Can not get range") }
    let url = input[range]
    
    return String(url).components(separatedBy: "&")[0]
}
    
class ViewController: UIViewController {



override func viewDidLoad() {
    super.viewDidLoad()
    
    //guard let url = URL(string: "https://www.amazon.com/dp/B08FC6C75Y") else {
    guard let url = URL(string: "https://www.amazon.com/dp/B0084DS9EE") else {
        fatalError("Can not get url")
    }
//    let imgUrl = getProductImage(url: url)
    //print(imgUrl)// https://images-na.ssl-images-amazon.com/images/I/61o7ai%2BYDoL._SL1441_.jpg
//    print(imgUrl)  // https://images-na.ssl-images-amazon.com/images/I/41ZmuuKMtmL._SY450_.jpg
 }
}



class ImageLoaderViewController: UIViewController {
    
    var url: URL? {
        didSet {
            if let url = url {
            loadImage(from: url)
            }
        }
    }
   
}





