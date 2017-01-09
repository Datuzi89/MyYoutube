//
//  BaseCollectionViewCell.swift
//  MyYoutube
//
//  Created by Xuezhu on 1/8/17.
//  Copyright © 2017 Xuezhu. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
