//
//  ImageFetcher.swift
//  ScalableAPIClientDemo
//
//  Created by David on 10/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation
import UIKit

class ImageFactory: ImageProvider {
    
    var networkingProvider: NetworkingProvider
    
    init(networkingProvider: NetworkingProvider = URLSessionClient()) {
        self.networkingProvider = networkingProvider
    }
    
    func getImage(urlString: String, onCompleted: ((UIImage?) -> Void)?) {
        
        networkingProvider.restCall(urlString: urlString) { (imageData) in
            
            if let unwrappedImageData = imageData {
                let imageReturned = UIImage(data: unwrappedImageData)
                onCompleted?(imageReturned)
            }
        }
    }
    
}
