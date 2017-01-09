//
//  MenuCollectionViewCell.swift
//  MyBilibili
//
//  Created by Xuezhu on 1/8/17.
//  Copyright © 2017 Xuezhu. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: BaseCollectionViewCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet{
            backgroundColor = isHighlighted ? UIColor.rgb(red: 245, green: 110, blue: 155) : UIColor.white
            
        }
    }
    
    override var isSelected: Bool {
        didSet{
            backgroundColor = isSelected ? UIColor.rgb(red: 245, green: 110, blue: 155) : UIColor.white
        }
    }

    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.white
        addSubview(imageView)
        addConstrainsWithFormat(format: "H:|-16-[v0(40)]-10-|", views: imageView)
        addConstrainsWithFormat(format: "V:|[v0(40)]|", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
