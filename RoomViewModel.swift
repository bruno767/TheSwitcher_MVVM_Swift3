//
//  RoomViewModel.swift
//  TheSwitcher_Bruno_Alves
//
//  Created by Bruno Augusto Mendes Barreto Alves on 11/06/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

import Foundation

public struct RoomViewModel {
    var name:String
    var isSwitched: Bool
    var light:String

}

extension RoomViewModel{
    func toString() -> String {
        if isSwitched{
            return "Your " + name + " light is ON"
        }else{
            return "Your " + name + " light is OFF"
        }
    }
}
