//
//  myProgressHUDBasic.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class myProgressHUDBasic: UIView {
    public var progressColorHex:String="";
    public var borderColorHex:String="";
    public var backgroundColorHex:String="";
    @IBOutlet var contentview: UIView!
    public let xibname:String="myProgressHUDBasic";
    public func setColor(highColorHex:String, bColorHex:String, bgColorHex:String){
        self.progressColorHex=highColorHex;
        self.borderColorHex=bColorHex;
        self.backgroundColorHex=bgColorHex;
    }
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
        self.fixInView(self)
        self.setBarHighlight(ratio: 0.5);
    }
}
extension myProgressHUDBasic{
    public func setBarHighlight(ratio: Double) {
        let highlightColor = UiUtil.hexStringToUIColor(hex: self.progressColorHex != "" ? self.progressColorHex : "B41E8C")
        let highlightViewFrame = CGRect(x: contentview.bounds.origin.x, y: contentview.bounds.origin.y, width: contentview.frame.width * CGFloat(ratio), height: contentview.frame.height)
        let highlightView = UIView(frame: highlightViewFrame)
        highlightView.backgroundColor = highlightColor
        contentview.layer.borderWidth=0.5;
        contentview.layer.borderColor = self.borderColorHex != "" ? UiUtil.hexStringToUIColor(hex: self.borderColorHex).cgColor : UIColor.gray.cgColor;
        contentview.addSubview(highlightView)
    }
}
