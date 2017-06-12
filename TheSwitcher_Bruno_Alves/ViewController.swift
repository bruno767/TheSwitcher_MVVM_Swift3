//
//  ViewController.swift
//  TheSwitcher_Bruno_Alves
//
//  Created by Bruno Augusto Mendes Barreto Alves on 20/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var lightBg: UIImageView!
    var roomViewModel: RoomViewModel?
    @IBOutlet weak var statusLight: UILabel!
    @IBOutlet weak var nameRoom: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = roomViewModel?.name
        lightBg.image = UIImage(named: (roomViewModel?.light)!)
        nameRoom.text = roomViewModel?.name
        statusLight.text = roomViewModel?.toString()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

