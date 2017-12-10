//
//  AppsFactoryProvider.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation

protocol AppsFactoryProvider {
    func app(withJSON json: Any) -> App?
    func apps(withJSON json: Any) -> [App]
}
