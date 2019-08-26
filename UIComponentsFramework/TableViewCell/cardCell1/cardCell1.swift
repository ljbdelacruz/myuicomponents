//
//  cardCell1.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class cardCell1: UITableViewCell {
    public static let identifier:String="cardCell1";
    public static let nibname:String="cardCell1";
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var cardName: UILabel!
    @IBOutlet public weak var cardNumber: UILabel!
    var vm:BaseTVCellVM?{
        didSet{
            self.myimage.image=vm!.image;
            self.cardName.text=vm!.title;
            self.cardName.textColor=vm!.titleColor;
            self.cardNumber.text=vm!.subDesc;
            self.cardNumber.textColor=vm!.subDescTextColor
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(vm!.isSelected ?? false, animated: animated)
    }
    public func setup(vm:BaseTVCellVM){
        self.vm=vm;
    }

}

