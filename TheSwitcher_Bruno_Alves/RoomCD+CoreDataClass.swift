//
//  RoomCD+CoreDataClass.swift
//  TheSwitcher_Bruno_Alves
//
//  Created by Bruno Augusto Mendes Barreto Alves on 11/06/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

import Foundation
import CoreData


public class RoomCD: NSManagedObject {
    var light : String{
        get{
            if isSwitched {
                return "light_image_ON"
            }else{
                return "light_image_OFF"
            }
        }
    }   
}
