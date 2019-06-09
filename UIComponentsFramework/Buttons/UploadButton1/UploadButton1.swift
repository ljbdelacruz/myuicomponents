//
//  UploadButton1.swift
//  UIComponentsFramework
//
//  Created by devops on 07/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class UploadButton1: UIView {
    public let xibname:String="UploadButton1";
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
    
    
}