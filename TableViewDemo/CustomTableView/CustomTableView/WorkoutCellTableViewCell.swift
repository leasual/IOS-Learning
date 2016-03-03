//
//  WorkoutCellTableViewCell.swift
//  CustomTableView
//
//  Created by leasual on 16/3/2.
//  Copyright © 2016年 wesoft. All rights reserved.
//

import UIKit

class WorkoutCellTableViewCell: UITableViewCell {

    @IBOutlet weak var countCell: UILabel!
    @IBOutlet weak var textCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
