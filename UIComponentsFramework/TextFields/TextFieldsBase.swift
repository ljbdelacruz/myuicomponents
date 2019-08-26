//
//  TextFieldsBase.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 26/08/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


public class TextFieldsBaseVM{
    public var image:UIImage?;
    public var placeholder:String?
    public var placeholderColor:UIColor?
    public var text:String?
    public var textColor:UIColor?
    public var textDesign:TextFieldDesignVM?;
    public var borderRadius:TextFieldBaseVMBorders?;
    public var tag:Int?
    public var isSecureEntry:Bool?=false
    public var isContainerTransparent:Bool?=false;
}
public class TextFieldDesignVM{
    public var bgColor:UIColor?
    public var color:UIColor?;
    public var borderColor:UIColor?;
    public var changePlaceholderColor:UIColor?
    public var borderWidth:CGFloat?;
    public var shadow:ShadowModel?;
    
    public func setPlaceholderColor(view:UITextField){
        view.changePlaceholderColor(color: bgColor!)
    }
    
}

public class TextFieldBaseVMBorders{
    public var color:UIColor?
    public var radius:CGFloat?
    public func set(view:UIView){
        view.setupRadius(bgColor: self.color!, radius: self.radius!);
    }
}

public protocol ITextFieldBase{
    func buttonOnClick(tag:Int)
    func textDidChange(data:String)
}
