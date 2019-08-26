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
    public var vm:RoundedImageTFVM?{
        didSet{
            self.mytextfield.text=vm!.text;
            self.mytextfield.backgroundColor=vm!.textDesign!.bgColor!
            self.mytextfield.textColor=vm!.textColor;
            self.mytextfield.placeholder=vm!.placeholder;
            self.mytextfield.layer.borderWidth=vm!.textDesign!.borderWidth!
            self.mytextfield.layer.borderColor=vm!.textDesign!.borderColor!.cgColor
            self.vm!.textDesign!.setPlaceholderColor(view: self.mytextfield);
            self.myimage.image=vm!.image!;
            self.vm!.borderRadius!.set(view: contentview);
            vm!.textDesign!.shadow!.setView(view: contentview);
            self.mytextfield.isSecureTextEntry=vm!.isSecureEntry!
            if vm!.isContainerTransparent! {
                self.backgroundColor=UIColor.mytransparent();
            }
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
    }
    public func setup(vm:RoundedImageTFVM){
        self.vm=vm;
    }
}

public class RoundedImageTFVM:TextFieldsBaseVM{
    override init(){
        super.init();
        self.borderRadius=TextFieldBaseVMBorders();
        self.borderRadius?.color=UIColor.white;
        self.borderRadius?.radius=18;
        self.textDesign=TextFieldDesignVM();
        textDesign?.bgColor=UIColor.white;
        textDesign?.color=UiUtil.hexStringToUIColor(hex: "B9B9B9");
        textDesign?.borderColor=UIColor.mytransparent();
        textDesign?.changePlaceholderColor=UiUtil.hexStringToUIColor(hex: "B9B9B9");
        textDesign?.borderWidth=0;
        textDesign?.shadow=ShadowModel();
        textDesign?.shadow?.radius=3.0;
        textDesign?.shadow?.width=1.0;
        textDesign?.shadow?.height=1.0;
        textDesign?.shadow?.opacity=0.1;
    }
}
