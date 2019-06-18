//
//  RoundedImageTextFields.swift
//  UIComponentsFramework
//
//  Created by devops on 27/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class RoundedImageTextFields: UIView {
    public let xibname:String="RoundedImageTextFields";
    @IBOutlet var contentview: UIView!
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var mytextfield: UITextField!
    
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
        self.setDefault();
    }
    public func setDefault(){
        contentview.setupRadius(bgColor: UIColor.white, radius: 18);
        contentview.setMyShadow(radius: 3.0, width: 1.0, height: 1.0, opacity: 0.1);
        mytextfield.backgroundColor=UIColor.white;
        mytextfield.textColor=UiUtil.hexStringToUIColor(hex: "B9B9B9");
        mytextfield.layer.borderWidth=0;
        mytextfield.layer.borderColor=UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.0).cgColor;
        mytextfield.changePlaceholderColor(color: UiUtil.hexStringToUIColor(hex: "B9B9B9"));
    }
}
