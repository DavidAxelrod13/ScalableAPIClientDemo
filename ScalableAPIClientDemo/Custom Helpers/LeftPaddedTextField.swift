//
//  LeftSpacedTextField.swift
//  Uber Driver
//
//  Created by David on 25/11/2017.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class LeftPaddedTextField: UITextField {
    
    let padding = UIEdgeInsetsMake(0, 5, 0, 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
}
