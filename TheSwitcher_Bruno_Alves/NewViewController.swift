//
//  NewViewController.swift
//  TheSwitcher_Bruno_Alves
//
//  Created by Bruno Augusto Mendes Barreto Alves on 21/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    var roomViewModelController = RoomViewModelController()
    
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var nameText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    @IBAction func done(_ sender: Any) {
        guard let name = nameText.text
            else {
                return
        }
        
        if !name.isEmpty{
            
            self.roomViewModelController.createRoom(name: name, isSwitched: self.statusSwitch.isOn)
            _ = navigationController?.popViewController(animated: true)
            
        }else{
            self.showErroMessage()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showErroMessage(){
        let alert = UIAlertController(title: "Empty Name!", message: "Please insert Room's name", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
}
