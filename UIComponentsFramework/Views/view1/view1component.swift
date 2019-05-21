//
//  view1component.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/19/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit


public class view1component: UIView {
    
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var value1: UILabel!
    @IBOutlet weak var of: UILabel!
    @IBOutlet weak var value2: UILabel!
    @IBOutlet weak var myprogressHUD: myProgressHUDBasic!
    public let xibname:String="view1"
    
    override public init(frame: CGRect) {
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
        self.myprogressHUD.setBarHighlight(ratio: 0.5);
    }
}
//MARK: Setting properties
extension view1component {
    public func setProgressHUDColor(highlightColorHex:String, bgColorHex:String, borderColorHex:String){
        self.myprogressHUD.setColor(highColorHex: highlightColorHex, bColorHex: borderColorHex, bgColorHex: bgColorHex)
    }
}


