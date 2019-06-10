//
//  twoEventTF1.swift
//  UIComponentsFramework
//
//  Created by devops on 10/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class twoEventTF1: UIView {
    public let xibname:String="twoEventTF1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var leftButton: UIImageView!
    @IBOutlet weak var rightButton: UIImageView!
    @IBOutlet weak var contentInput: UITextField!
    
    
    
    
    
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
        contentview.setupRadius(bgColor: UIColor.init(white: 0, alpha: 0), radius: 20);
    }
    
    
    
}
