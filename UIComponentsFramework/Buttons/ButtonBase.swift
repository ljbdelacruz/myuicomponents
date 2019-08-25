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
}

