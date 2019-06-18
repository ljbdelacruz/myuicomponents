//
//  containerDesign1View.swift
//  UIComponentsFramework
//
//  Created by devops on 18/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class containerDesign1View: UIView {
    public let xibname:String="ContainerDesign1";
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
    }
    public func setContentColor(color:UIColor){
        if self != nil {
            self.backgroundColor=color;
        }
    }
    public func setRadius(corner:UIRectCorner, radius:CGFloat){
        if self != nil{
            self.roundCorners(corners: corner, radius: radius)
        }
    }
    
    
    
    
}
