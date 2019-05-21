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
    @IBOutlet weak var myprogressHUD: UIView!
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
        self.setBarHighlight(ratio: 0.5);
    }

}

extension view1component{
    public func setBarHighlight(ratio: Double) {
//        let highlightColor = UiUtil.hexStringToUIColor(hex: "B41E8C")
        let highlightColor=UIColor.blue;
        let highlightViewFrame = CGRect(x: myprogressHUD.bounds.origin.x, y: myprogressHUD.bounds.origin.y, width: myprogressHUD.frame.width * CGFloat(ratio), height: myprogressHUD.frame.height)
        let highlightView = UIView(frame: highlightViewFrame)
        highlightView.backgroundColor = highlightColor
        myprogressHUD.layer.borderWidth=0.5;
        myprogressHUD.layer.borderColor=UIColor.gray.cgColor;
        myprogressHUD.addSubview(highlightView)
    }
}

