//
//  App.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation
import UIKit

//class App {
//
//    let appDetail: AppDetail
//    var appImage: UIImage?
//
//    init(appDetail: AppDetail) {
//        self.appDetail = appDetail
//    }
//}

class App {
    
    let name: String
    let releaseDate: String?
    let artistName: String?
    let artworkUrl100: String?
    let url: String?
    var genre: Genre?
    var iconImage: UIImage?
    
    init(jsonDict: [String: Any]) {
        
        self.name = jsonDict["name"] as? String ?? ""
        self.releaseDate = jsonDict["releaseDate"] as? String
        self.artistName = jsonDict["artistName"] as? String
        self.artworkUrl100 = jsonDict["artworkUrl100"] as? String
        self.url = jsonDict["url"] as? String
        
    }
}


class Genre {
    
    var name: String?
    
    init(arrayOfGenreDicts: [[String: Any]]) {
        self.name = arrayOfGenreDicts.first!["name"] as? String
    }
}





