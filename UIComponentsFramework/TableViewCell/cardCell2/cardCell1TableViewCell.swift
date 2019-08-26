//
//  cardCell1TableViewCell.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class cardCell2: UITableViewCell {
    public static let identifier:String="cardCell2";
    public static let nibname:String="cardCell2";
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var mytitle: UILabel!
    @IBOutlet weak var cardNum: UILabel!
    @IBOutlet weak var mypoints: UILabel!
    var vm:cardCell2VM?{
        didSet{
            self.myimage.image=vm!.image;
            self.mytitle.text=vm!.title;
            self.mytitle.textColor=vm!.titleColor;
            self.cardNum.text=vm!.subDesc;
            self.cardNum.textColor=vm!.subDescTextColor;
            self.mypoints.text=vm!.myPoints;
            self.mypoints.textColor=vm!.myPointsColor;
        }
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(vm!.isSelected!, animated: animated)
    }
    public func setup(vm:cardCell2VM){
        self.vm=vm;
    }

}
public class cardCell2VM:BaseTVCellVM{
    public var myPoints:String?;
    public var myPointsColor:UIColor?
}

