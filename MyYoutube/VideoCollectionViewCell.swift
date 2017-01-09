//
//  VideoCollectionViewCell.swift
//  MyYoutube
//
//  Created by Xuezhu on 1/6/17.
//  Copyright © 2017 Xuezhu. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: BaseCollectionViewCell {
    
    
    let userProfileImageSize = 44
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            thumbnailImageView.image = UIImage(named: (video?.thumbnailImageName)!)
            if let profileImageName = video?.channel?.profileImageName {
                userProfileImageView.image = UIImage(named: profileImageName)
                if  let channelName = video?.channel?.name, let nameOfViews = video?.numberOfViews {
                    let subtitleText = "\(channelName) ∙ \(nameOfViews) ∙ 2 years ago"
                    subtitleTextView.text = subtitleText
                }
            }
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "videoCoverPage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userProfile")
        imageView.layer.cornerRadius = 44 / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title of the video"
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "The number of views ∙ Date of uploaded lalalalalalalalalalalalalalal"
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.lightGray
        return textView
    }()

    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    override func setupViews() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)

        
        addConstrainsWithFormat(format: "V:|-16-[v0]-8-[v1(\(userProfileImageSize))]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstrainsWithFormat(format: "H:|-16-[v0(\(userProfileImageSize))]|", views: userProfileImageView)
        addConstrainsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
    }
    
    
    
}

