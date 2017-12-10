//
//  AppCell.swift
//  ScalableAPIClientDemo
//
//  Created by David on 09/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import Foundation
import UIKit

class AppCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .black
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstaintsForSubviews()
    }
    
    
    private func setupConstaintsForSubviews() {
        
        addSubview(appIconImageView)
        
        appIconImageView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, topPadding: 0, leadingPadding: 10, bottomPadding: 0, trailingPadding: 0, width: 50, height: 50)
        appIconImageView.anchorCenterYToSuperview()
        
        addSubview(nameLabel)
        
        nameLabel.anchor(top: appIconImageView.topAnchor, leading: appIconImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, topPadding: 0, leadingPadding: 10, bottomPadding: 0, trailingPadding: 10, width: 0, height: 20)
        
        addSubview(genreLabel)
        
        genreLabel.anchor(top: nameLabel.bottomAnchor, leading: nameLabel.leadingAnchor, bottom: appIconImageView.bottomAnchor, trailing: nameLabel.trailingAnchor, topPadding: 0, leadingPadding: 0, bottomPadding: 0, trailingPadding: 0, width: 0, height: 0)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}



