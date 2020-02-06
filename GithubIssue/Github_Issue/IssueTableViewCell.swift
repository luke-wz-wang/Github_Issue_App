//
//  IssueTableViewCell.swift
//  Github_Issue
//
//  Created by sinze vivens on 2020/1/26.
//  Copyright © 2020 Luke. All rights reserved.
//

import UIKit

class IssueTableViewCell: UITableViewCell {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgViewInCell: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }

}
