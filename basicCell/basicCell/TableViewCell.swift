//
//  TableViewCell.swift
//  basicCell
//
//  Created by mac on 7/3/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var byLine: UILabel!
   
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var heading: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
