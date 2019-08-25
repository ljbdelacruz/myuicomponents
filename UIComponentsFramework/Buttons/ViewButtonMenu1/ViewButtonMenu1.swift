//
//  ViewButtonMenu1.swift
//  UIComponentsFramework
//
//  Created by devops on 24/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
public protocol IViewButtonMenu1:IButton{
}

public class ViewButtonMenu1: UIView {
    public let xibname:String="ViewButtonMenu1";
    @IBOutlet public var containerview: UIView!
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var myDesc: UITextView!
    var vm:ViewButtonMenu1VM?{
        didSet{
            self.containerview.backgroundColor=vm?.contentColor ?? UIColor.mytransparent();
            self.myimage.image=vm?.image;
            self.myDesc.text=vm?.title;
            self.myDesc.adjustTextView();
            self.myDesc.textColor=vm?.textColor ?? UIColor.white;
        }
    }
    var handler:IViewButtonMenu1?;
    
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
        containerview.fixInView(self)
    }
    func setup(vm:ViewButtonMenu1VM, handler:IViewButtonMenu1){
        self.vm=vm;
        self.handler=handler;
    }
    
}
extension ViewButtonMenu1{
    func getRecog()->UITapGestureRecognizer{
        let recog = UITapGestureRecognizer(target: self, action: #selector(onClick))
        return recog;
    }
    func setupGestures(){
        self.containerview.addGestureRecognizer(self.getRecog());
    }
    @objc func onClick(){
        self.handler?.onButtonClick(tag: vm!.tag!);
    }
}
public class ViewButtonMenu1VM:ButtonVMBase{
    public var image:UIImage?;
}
