//
//  basic2TableViewCell.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/26/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class basic2TableViewCell: UITableViewCell {
    public static let identifier:String="basicCell2";
    public static let nibname:String="basicCell2";
    @IBOutlet var mytvcell: UITableViewCell!
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var mytitle: UILabel!
    var vm:BaseTVCellVM?{
        didSet{
            self.myimage.image=vm!.image;
            self.mytitle.text=vm!.title;
            self.mytitle.textColor=vm!.titleColor;
        }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(vm!.isSelected ?? false, animated: animated)
    }
    public func setup(vm:BaseTVCellVM){
        self.vm=vm;
    }
}
