//
//  Task+CoreDataProperties.swift
//  StudyRoom
//
//  Created by Max on 8/14/24.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var elapsedTime: Double
    @NSManaged public var goalTime: Double
    @NSManaged public var isFinished: Bool
    @NSManaged public var icon: String?
    @NSManaged public var notifications: Bool
    @NSManaged public var color: NSObject?

}

extension Task : Identifiable {

}
