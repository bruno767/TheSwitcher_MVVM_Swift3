//
//  RoomsTableViewController.swift
//  TheSwitcher_Bruno_Alves
//
//  Created by Bruno Augusto Mendes Barreto Alves on 20/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

import UIKit


class RoomsTableViewController: UITableViewController {

    let roomViewModelController = RoomViewModelController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Customizing navbar
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 115.0/255.0, green: 161.0/255.0, blue: 81.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
     }

    override func viewDidAppear(_ animated: Bool) {
        roomViewModelController.retrieveRooms({ [unowned self] in
            self.tableView.reloadData()
            }, failure: nil)
        print(roomViewModelController.roomsCount)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source

    @IBAction func switched(_ sender: UISwitch){
        roomViewModelController.RoomViewModelSwitched(at: sender.tag)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return roomViewModelController.roomsCount
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SelectedRoom", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! cellTableViewCell
        
        cell.plug.tag = indexPath.row
        
        cell.cellModel = roomViewModelController.viewModel(at: (indexPath as NSIndexPath).row)

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            roomViewModelController.deleteRoom(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SelectedRoom") {
            let controller = segue.destination as! ViewController
            let row = (sender as! NSIndexPath).row; //we know that sender is an NSIndexPath here.
            let room = self.roomViewModelController.viewModel(at: row)
            controller.roomViewModel = room
        }else{
            _ = segue.destination as! NewViewController
        }
    }
 
}
