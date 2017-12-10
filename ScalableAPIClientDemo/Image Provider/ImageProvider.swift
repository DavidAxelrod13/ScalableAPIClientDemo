//
//  ImageFactoryProvider.swift
//  ScalableAPIClientDemo
//
//  Created by David on 10/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation
import UIKit

protocol ImageProvider {
    func getImage(urlString: String, onCompleted: ((UIImage?) -> Void)?)
}
