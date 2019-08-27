//
//  ViewsBaseVM.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 26/08/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import UIKit

public class ViewsBaseVM{
    public var contentDesign:ViewBaseDesignVM?
    public var image:UIImage?
    public var title:String?
    public var titleDesign:ViewBaseDesignVM?;
    public var subDesc:String?;
    public var subDescDesign:ViewBaseDesignVM?
    public var tag:Int?;
}

public protocol IViewsBase{
    func onClick(tag:Int)
}
