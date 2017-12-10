//
//  ListDisplayable.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation
import UIKit

protocol ListDisplayable {
    var listItemTitle: String { get set }
    var listItemSubtitle: String? { get set }
    var thumbnailImage: UIImage? { get set }
}
