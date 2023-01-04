//
//  AllEmployeeDetailCell.swift
//  SQLiteDemo
//
//  Created by Sunil Developer on 04/01/23.
//

import UIKit

class AllEmployeeDetailCell: UITableViewCell {
static let identifier = "AllEmployeeDetailCell"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
