//
//  basicCell4TableViewCell.swift
//  UIComponentsFramework
//
//  Created by devops on 18/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class basicCell4TableViewCell: UITableViewCell {
    public static let identifier:String="basicCell3";
    public static let nibname:String="basicCell3";
    @IBOutlet weak var mytitle: UILabel!
    @IBOutlet weak var mycontent: UILabel!
    var vm:BaseTVCellVM?{
        didSet{
            self.mytitle.text=vm!.title;
            self.mytitle.textColor=vm?.titleColor
            self.mycontent.text=vm!.subDesc;
            self.mycontent.textColor=vm!.subDescTextColor;
        }
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(vm!.isSelected ?? false, animated: animated)
        // Configure the view for the selected state
    }
    func setup(vm:BaseTVCellVM){
        
    }

}
