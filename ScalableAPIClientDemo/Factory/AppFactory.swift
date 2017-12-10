//
//  AppFactory.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation

class AppFactory: AppsFactoryProvider {
    
    
    
    func app(withJSON json: Any) -> App? {
        
        guard let appDict = json as? [String: Any] else { return nil }
        
        let app = App(jsonDict: appDict)
        
        if let arrayOfGenreDicts = appDict["genres"] as? [[String: Any]] {
            let appGenre = Genre(arrayOfGenreDicts: arrayOfGenreDicts)
            app.genre = appGenre
        }
                
        return app
        
    }
    
    func apps(withJSON json: Any) -> [App] {
        
        var apps = [App]()
        
        // loop through and use the app func then append to the array
        guard let dictOfValues = json as? [String: Any] else { return apps }
        guard let feedJSON = dictOfValues["feed"] as? [String: Any] else { return apps }
        guard let arrayOfAppDicts = feedJSON["results"] as? [[String: Any]] else { return apps }
        
        arrayOfAppDicts.forEach { (appDict) in
            if let app = self.app(withJSON: appDict) {
                apps.append(app)
            }
        }
        
        return apps
    }
    
    
}
