//
//  ViewController.swift
//  MyYoutube
//
//  Created by Xuezhu on 1/5/17.
//  Copyright © 2017 Xuezhu. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var managedObjectContext: NSManagedObjectContext? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        setupMenuBar()
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        let settingImage = UIImage(named: "setting")?.withRenderingMode(.alwaysOriginal)
        let settingButton = UIBarButtonItem(image: settingImage, style: .plain, target: self, action: #selector(handleSetting))
        navigationItem.rightBarButtonItem = settingButton
    }
    
    func handleSetting(){
        print(123)
    }
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstrainsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstrainsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCollectionViewCell
        cell.video = videos[indexPath.item]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 6 : 9 screen scale, pading 16, userprofile size 44, margin 8
        let height = (view.frame.width - 16 - 16) * 6 / 9
        return CGSize(width: view.frame.width, height: height + 16 + 44 + 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    var videos: [Video] = {
        var exampleChannel = Channel()
        exampleChannel.name = "Upload Channel"
        exampleChannel.profileImageName = "channelProfile"
        
        var exampleVideo = Video()
        exampleVideo.title = "Title of the video"
        exampleVideo.thumbnailImageName = "videoCoverPage"
        exampleVideo.channel = exampleChannel
        exampleVideo.numberOfViews = 100
        
        var exampleVideo2 = Video()
        exampleVideo2.title = "Title of the video"
        exampleVideo2.thumbnailImageName = "videoCoverPage"
        exampleVideo2.channel = exampleChannel
        exampleVideo2.numberOfViews = 303
        
        return [exampleVideo, exampleVideo2]
    }()
}




