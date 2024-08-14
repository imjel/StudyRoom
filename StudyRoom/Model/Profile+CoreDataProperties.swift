//
//  Profile+CoreDataProperties.swift
//  StudyRoom
//
//  Created by Max on 8/14/24.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var username: String?
    @NSManaged public var prefersNotifications: Bool
    @NSManaged public var photo: String?
    @NSManaged public var birthday: Date?

}

extension Profile : Identifiable {

}
