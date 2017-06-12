//
//  RoomCD+CoreDataProperties.swift
//  TheSwitcher_Bruno_Alves
//
//  Created by Bruno Augusto Mendes Barreto Alves on 11/06/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

import Foundation
import CoreData


extension RoomCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomCD> {
        return NSFetchRequest<RoomCD>(entityName: "RoomCD")
    }

    @NSManaged public var name: String?
    @NSManaged public var isSwitched: Bool

}
