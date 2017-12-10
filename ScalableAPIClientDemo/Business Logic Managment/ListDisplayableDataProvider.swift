//
//  ListDisplayableDataProvider.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation

protocol ListDisplayableDataProvider {
    func getListItems(onCompleted: (([ListDisplayable]) -> Void)?)
}

