//
//  AppsDataProvider.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation

protocol AppsDataProvider {
    var networkingProvider: NetworkingProvider { get set }
    var appsFactoryProvider: AppsFactoryProvider { get set }
    func getApps(onCompleted: (([App]) -> Void)?)
}
