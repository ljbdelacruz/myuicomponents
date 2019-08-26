//
//  basic1TableViewCell.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/26/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class basic1TableViewCell: UITableViewCell {
    public let identifier:String="basicCell1";
    public let xibname:String="basicCell1";
    @IBOutlet public var mytvcell: UITableViewCell!
    @IBOutlet public weak var mytitle: UILabel!
    @IBOutlet public weak var myDesc: UITextView!
    var vm:BaseTVCellVM?{
        didSet{
            self.mytitle.text=vm!.title;
            self.mytitle.textColor=vm!.titleColor
            self.myDesc.text=vm!.subDesc;
            self.myDesc.textColor=vm!.subDescTextColor;
        }
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    public func setup(vm:BaseTVCellVM){
        self.vm=vm;
    }
}
