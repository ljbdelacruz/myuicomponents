//
//  ButtonBase.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 25/08/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

public protocol IButton{
    func onButtonClick(tag:Int)
}
public class ButtonVMBase{
    public var contentColor:UIColor?;
    public var tag:Int?;
    public var title:String?;
    public var textColor:UIColor?;
    public var shadowModel:ShadowModel?;
}

public class ShadowModel{
    public var radius:CGFloat?;
    public var width:CGFloat?;
    public var height:CGFloat?
    public var opacity:Float?
    func set(radius:CGFloat, width:CGFloat, height:CGFloat, opacity:Float){
        self.radius=radius;
        self.width=width;
        self.height=height;
        self.opacity=opacity;
    }
    func setView(view:UIView){
        view.setMyShadow(radius: self.radius!, width: self.width!, height: self.height!, opacity: self.opacity!)
    }
}
