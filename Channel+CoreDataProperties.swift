//
//  Channel+CoreDataProperties.swift
//  MyYoutube
//
//  Created by Xuezhu on 1/9/17.
//  Copyright © 2017 Xuezhu. All rights reserved.
//

import Foundation
import CoreData


extension Channel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Channel> {
        return NSFetchRequest<Channel>(entityName: "Channel");
    }

    @NSManaged public var name: String?
    @NSManaged public var profileImageName: String?
    @NSManaged public var videos: NSSet?

}

// MARK: Generated accessors for videos
extension Channel {

    @objc(addVideosObject:)
    @NSManaged public func addToVideos(_ value: Video)

    @objc(removeVideosObject:)
    @NSManaged public func removeFromVideos(_ value: Video)

    @objc(addVideos:)
    @NSManaged public func addToVideos(_ values: NSSet)

    @objc(removeVideos:)
    @NSManaged public func removeFromVideos(_ values: NSSet)

}
