//
//  twoEventTF1.swift
//  UIComponentsFramework
//
//  Created by devops on 10/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit


public protocol ItwoEventTF1:ITextFieldBase{
    func leftButtonOnClick(tag:Int)
}

public class twoEventTF1: UIView {
    public let xibname:String="twoEventTF1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var leftButton: UIImageView!
    @IBOutlet weak var rightButton: UIImageView!
    @IBOutlet weak var contentInput: UITextField!
    var vm:twoEventTF1VM?{
        didSet{
            self.rightButton.image=vm!.image;
            self.leftButton.image=vm!.leftImage;
            self.contentInput.placeholder=vm!.placeholder;
            self.contentInput.text=vm?.text;
            self.contentInput.textColor=vm!.textColor
            contentview.setupRadius(bgColor: self.vm!.borderRadius!.color!, radius: vm!.borderRadius!.radius!);
        }
    }
    var handler:ItwoEventTF1?;
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
    public func setup(vm:twoEventTF1VM, handler:ItwoEventTF1){
        self.vm=vm;
        self.handler=handler
        self.contentInput.delegate=self;
    }
}
extension twoEventTF1{
    func setupTapRecognizer(){
        self.leftButton.setUIRecognizer(selector: #selector(leftOnClick))
        self.rightButton.setUIRecognizer(selector: #selector(rightOnClick))
    }
    @objc
    func leftOnClick(){
        handler?.leftButtonOnClick(tag: self.vm!.tag!)
    }
    @objc
    func rightOnClick(){
        handler?.buttonOnClick(tag: self.vm!.tag!)
    }
}
extension twoEventTF1:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText  = contentInput.text! + string
        self.handler?.textDidChange(data: searchText)
        self.vm?.text=searchText;
        return true
    }
}

public class twoEventTF1VM:TextFieldsBaseVM{
    public var leftImage:UIImage?;
    override init(){
        super.init();
        self.borderRadius=TextFieldBaseVMBorders();
        borderRadius?.color=UIColor.init(white: 0, alpha: 0);
        borderRadius?.radius=20;
    }
}

