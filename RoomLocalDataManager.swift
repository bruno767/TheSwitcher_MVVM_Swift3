//
//  RoomLocalDataManager.swift
//  TheSwitcher_Bruno_Alves
//
//  Created by Bruno Augusto Mendes Barreto Alves on 11/06/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//
import CoreData
import UIKit

enum PersistenceError: Error {
    case managedObjectContextNotFound
    case couldNotCreateObject
    case objectNotFound
}

class RoomLocalDataManager {
     func createRoom(name:String,isSwitched: Bool) -> RoomCD {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return RoomCD()
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "RoomCD",
                                       in: managedContext)!
        
        let room = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        room.setValue(name, forKeyPath: "name")
        room.setValue(isSwitched, forKeyPath: "isSwitched")
        
        do {
            try managedContext.save()
            
            return room as! RoomCD
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return RoomCD()
        }
    }
    
    func retrieveRoomList() throws -> [RoomCD] {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return [RoomCD]()
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "RoomCD")
        
        do {
            return try managedContext.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [RoomCD]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return [RoomCD]()
        }
    }
    
    func updateRoom(roomViewModel: RoomViewModel) throws {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "RoomCD")
        fetchRequest.predicate = NSPredicate(format: "name = %@", roomViewModel.name)
        
        if let fetchResults = try managedContext.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as? [NSManagedObject] {
            if fetchResults.count != 0{
                let managedObject = fetchResults[0]
                managedObject.setValue(roomViewModel.isSwitched, forKey: "isSwitched")
                
                try managedContext.save()
                
            }
        }
    }
    func deleteRoom(by name: String) throws {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "RoomCD")
        fetchRequest.predicate = NSPredicate(format: "name = %@", name)
        
        if let fetchResults = try managedContext.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as? [NSManagedObject] {
            if fetchResults.count != 0{
                managedContext.delete(fetchResults[0])
            }
        }
    }
    

}
