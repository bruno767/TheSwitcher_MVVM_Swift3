//
//  cellTableViewCell.swift
//  TheSwitcher_Bruno_Alves
//
//  Created by Bruno Augusto Mendes Barreto Alves on 20/02/2017.
//  Copyright © 2017 Bruno Augusto Mendes Barreto Alves. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    @IBOutlet weak var plug: UISwitch!
    @IBOutlet weak var roomName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    var cellModel: RoomViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    func bindViewModel() {
        roomName?.text = cellModel?.name
        plug.isOn = (cellModel?.isSwitched)!
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
