//
//  PointsCell1.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class PointsCell1: UITableViewCell {
    public static let identifier:String="PointsCell1";
    public static let nibname:String="PointsCell1";
    @IBOutlet public weak var monthLabel: UILabel!
    @IBOutlet public weak var points: UILabel!
    @IBOutlet public weak var subDesc: UILabel!
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
