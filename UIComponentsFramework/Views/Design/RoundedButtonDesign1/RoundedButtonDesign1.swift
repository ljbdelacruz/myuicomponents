//
//  RoundedButtonDesign1.swift
//  UIComponentsFramework
//
//  Created by devops on 10/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

//roundedBottomDesign for design

import UIKit

public class RoundedButtonDesign1: UIView {
    public let xibname:String="RoundedButtonDesign1";
    @IBOutlet var contentview: UIView!
    override public init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    public func commonInit() {
        Bundle.main.loadNibNamed(xibname, owner: self, options: nil)
        contentview.fixInView(self)
        self.setUI(radius: 10);
    }
    public func setUI(radius:CGFloat){
        contentview.roundCorners(corners: [.bottomLeft, .bottomRight], radius: radius)
    }
    public func setColor(color:UIColor){
        self.contentview.backgroundColor=color;
    }
    
    
}
