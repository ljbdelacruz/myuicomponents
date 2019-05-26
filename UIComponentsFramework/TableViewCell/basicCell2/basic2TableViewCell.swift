//
//  basic2TableViewCell.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/26/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class basic2TableViewCell: UITableViewCell {

    @IBOutlet var mytvcell: UITableViewCell!
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var mytitle: UILabel!
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
