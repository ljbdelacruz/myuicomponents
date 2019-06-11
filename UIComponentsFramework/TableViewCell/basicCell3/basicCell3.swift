//
//  basicCell3.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class basicCell3: UITableViewCell {
    public static let identifier:String="basicCell3";
    public static let nibname:String="basicCell3";
    @IBOutlet public weak var mytitle: UILabel!
    @IBOutlet public weak var mySubDesc: UILabel!
    @IBOutlet public weak var myRightImage: UIImageView!
    
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
