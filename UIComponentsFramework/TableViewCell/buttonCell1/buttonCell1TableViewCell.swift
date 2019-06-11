//
//  buttonCell1TableViewCell.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class buttonCell1TableViewCell: UITableViewCell {
    public static let identifier:String="buttonCell1";
    public static let nibname:String="buttonCell1";
    
    @IBOutlet weak var mytitle: UILabel!
    @IBOutlet weak var myimage: UIImageView!
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
