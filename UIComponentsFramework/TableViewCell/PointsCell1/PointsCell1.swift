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
    var vm:PointsCell1VM?{
        didSet{
            self.monthLabel.text=vm!.monthLabel
            self.monthLabel.textColor=vm!.monthLabelColor
            self.points.text=vm!.points;
            self.points.textColor=vm!.pointColor
            self.subDesc.text=vm!.subDesc;
            self.subDesc.textColor=vm!.subDescTextColor
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(vm!.isSelected!, animated: animated)
    }
    public func setup(vm:PointsCell1VM){
        self.vm=vm;
    }

}

public class PointsCell1VM:BaseTVCellVM{
    public var points:String?
    public var pointColor:UIColor?
    public var monthLabel:String?
    public var monthLabelColor:UIColor?
}
