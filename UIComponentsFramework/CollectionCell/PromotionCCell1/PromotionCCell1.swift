//
//  PromotionCCell1.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class PromotionCCell1: UICollectionViewCell {
    public static let identifier:String="promotionCCell1";
    public static let nibname:String="promotionCCell1";
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var mytitle: UILabel!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    public func toggleVisibility(){
        self.mytitle.isHidden = !self.mytitle.isHidden;
    }
    
    
}
