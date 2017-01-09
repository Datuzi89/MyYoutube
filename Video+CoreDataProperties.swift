//
//  Video+CoreDataProperties.swift
//  MyYoutube
//
//  Created by Xuezhu on 1/9/17.
//  Copyright © 2017 Xuezhu. All rights reserved.
//

import Foundation
import CoreData


extension Video {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Video> {
        return NSFetchRequest<Video>(entityName: "Video");
    }

    @NSManaged public var thumbnailImageName: String?
    @NSManaged public var title: String?
    @NSManaged public var numberOfViews: Int64
    @NSManaged public var uploadDate: NSDate?
    @NSManaged public var channel: Channel?

}
