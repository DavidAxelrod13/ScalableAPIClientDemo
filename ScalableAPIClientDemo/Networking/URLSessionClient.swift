//
//  NSURLClient.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation

class URLSessionClient: NetworkingProvider {
    
    func restCall(urlString: String, onCompleted: ((Data?) -> Void)?) {
        guard let url = URL(string: urlString) else {
            onCompleted?(nil)
            return }
        
        let urlTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("Error fetching the data: \(error)")
                onCompleted?(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("There has been no response returned!")
                onCompleted?(nil)
                return }
            if httpResponse.statusCode > 300 {
                print("There has been an HTTP Error, status code returned: \(httpResponse.statusCode)")
                onCompleted?(nil)
                return }
            
            guard let unwrappedData = data else { print("Error unwrapping the data"); return }
            
            print(unwrappedData)
            onCompleted?(unwrappedData)
        }
        
        urlTask.resume()
    }
}
