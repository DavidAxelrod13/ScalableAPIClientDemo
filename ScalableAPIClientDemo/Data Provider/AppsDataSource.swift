//
//  AppsDataSource.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation

class AppsDataSource: AppsDataProvider {
    
    var networkingProvider: NetworkingProvider
    var appsFactoryProvider: AppsFactoryProvider
    var imageFactoryProvider: ImageProvider
    
    private var urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/100/explicit.json"
    
    init(networkingProvider: NetworkingProvider = URLSessionClient(), appFactory: AppsFactoryProvider = AppFactory(), imageProvider: ImageProvider = ImageFactory()) {
        self.networkingProvider = networkingProvider
        self.appsFactoryProvider = appFactory
        self.imageFactoryProvider = imageProvider
    }
    
    func getApps(onCompleted: (([App]) -> Void)?) {
        
        networkingProvider.restCall(urlString: urlString) { (responseData) in
            
            guard let responseData = responseData, let jsonObject = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
            else {
                onCompleted?([])
                return
            }
            
            let apps = self.appsFactoryProvider.apps(withJSON: jsonObject)
            
            apps.forEach({ (app) in
                if let iconUrl = app.artworkUrl100 {
                    self.imageFactoryProvider.getImage(urlString: iconUrl, onCompleted: { (iconImage) in
                        app.iconImage = iconImage
                    })
                    onCompleted?(apps)
                }
            })
        }
    }
    
    
    
}
