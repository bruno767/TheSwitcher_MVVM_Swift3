//
//  RoomViewModelControler.swift
//  TheSwitcher_Bruno_Alves
//
//  Created by Bruno Augusto Mendes Barreto Alves on 11/06/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//


class RoomViewModelController {
    fileprivate var roomViewModelList: [RoomViewModel] = []
    fileprivate var dataManager = RoomLocalDataManager()
    
    var roomsCount: Int {
        return roomViewModelList.count
    }
    
    func retrieveRooms(_ success: (() -> Void)?, failure: (() -> Void)?) {
        do {
            
            let rooms = try dataManager.retrieveRoomList()
            roomViewModelList = rooms.map() { newRoom in
                let newRoomViewModel = RoomViewModel(name: newRoom.name!, isSwitched: newRoom.isSwitched, light: newRoom.light)
                return newRoomViewModel
            }
            
            roomViewModelList = roomViewModelList.sorted(by: {$0.name < $1.name})
            
            success?()
        } catch {
            failure?()
        }
    }

    func viewModel(at index: Int) -> RoomViewModel {
        return roomViewModelList[index]
    }

    func RoomViewModelSwitched(at index: Int) {
        if roomViewModelList[index].isSwitched == true{
            roomViewModelList[index].isSwitched = false
            roomViewModelList[index].light = "light_image_OFF"
            
        }else{
            roomViewModelList[index].isSwitched = true
            roomViewModelList[index].light = "light_image_ON"
        }
        do{
            try dataManager.updateRoom(roomViewModel: viewModel(at: index))
        }catch{
            print("Could not save!")
        }
    }
    
    func createRoom(name: String,isSwitched: Bool) {
        let room = dataManager.createRoom(name: name, isSwitched: isSwitched)
        let roomViewModel = RoomViewModel(name: name, isSwitched: isSwitched, light: room.light)
        roomViewModelList.append(roomViewModel)
    }
    func deleteRoom(at index: Int) {
        do{
            try dataManager.deleteRoom(by: roomViewModelList[index].name)
        }catch{
            print("couldnt delete object by name")
        }
        
        retrieveRooms({
            print("viewModel updated")
        }, failure: nil)
    }
    
}
