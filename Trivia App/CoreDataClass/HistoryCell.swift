//
//  HistoryCell.swift
//  Trivia App
//
//  Created by Tejas on 06/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var lblQ1 : UILabel!
    @IBOutlet weak var lblQ2 : UILabel!
    @IBOutlet weak var lblAns1 : UILabel!
    @IBOutlet weak var lblAns2 : UILabel!
    @IBOutlet weak var lblGameTime : UILabel!
    @IBOutlet weak var lblName : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
