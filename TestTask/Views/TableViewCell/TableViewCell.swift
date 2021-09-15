//
//  TableViewCell.swift
//  TestTask
//
//  Created by Hayk Ghazaryan on 15.09.21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var userID: UILabel!
    
    @IBOutlet var userName: UILabel!

    
    static let id = "TableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
