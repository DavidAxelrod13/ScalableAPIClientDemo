//
//  AppsManager.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation
import UIKit

class AppsManager: ListDisplayableDataProvider {
    
    var appsDataProvider: AppsDataProvider
    
    init(dataProvider: AppsDataProvider = AppsDataSource()) {
        self.appsDataProvider = dataProvider
    }
    
    func getListItems(onCompleted: (([ListDisplayable]) -> Void)?) {
        
        appsDataProvider.getApps { (apps) in
            
            let listItems = apps.map( { ListDisplayableItem(withApp: $0) } )
            
            DispatchQueue.main.async {
                onCompleted?(listItems)
            }
        }
    }
}

private struct ListDisplayableItem: ListDisplayable {
    
    var listItemTitle: String
    var listItemSubtitle: String?
    var thumbnailImage: UIImage?
    
    init(withApp app: App) {
        self.listItemTitle = app.name
        self.listItemSubtitle = app.genre?.name
    }
}
