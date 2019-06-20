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
    public var myvm:RoundedImageTFVM?{
        didSet{
            self.mytextfield.text=myvm!.text != nil && myvm!.text!.count > 0 ? myvm!.text! : "";
            self.mytextfield.placeholder=myvm!.placeholder! != nil && myvm!.placeholder!.count > 0 ? myvm!.placeholder! : "";
            self.myimage.image=myvm!.image!.count != nil &&  myvm!.image!.count > 0 ? UIImage(named: myvm!.image!) : nil;
        }
    }
    
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
        mytextfield.layer.borderColor=UIColor.mytransparent().cgColor;
        mytextfield.changePlaceholderColor(color: UiUtil.hexStringToUIColor(hex: "B9B9B9"));
    }
    public func setSecureEntry(){
        self.mytextfield.isSecureTextEntry=true;
    }
    public func setContainerTransparent(){
        self.backgroundColor=UIColor.mytransparent();
    }
}

public class RoundedImageTFVM{
    public var image:String?;
    public var placeholder:String?;
    public var text:String?;
    public init(){}
    convenience public init(image:String, placeholder:String, text:String){
        self.init();
        self.image=image;
        self.placeholder=placeholder;
        self.text=text;
    }
}
