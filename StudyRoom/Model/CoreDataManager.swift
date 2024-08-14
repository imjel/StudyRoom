//
//  CoreDataManager.swift
//  StudyRoom
//
//  Created by Max on 8/14/24.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

        let persistentContainer: NSPersistentContainer

        private init() {
            persistentContainer = NSPersistentContainer(name: "StudyRoomModel")
            persistentContainer.loadPersistentStores { (description, error) in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
        }

        var context: NSManagedObjectContext {
            return persistentContainer.viewContext
        }

        func saveContext() {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
}
