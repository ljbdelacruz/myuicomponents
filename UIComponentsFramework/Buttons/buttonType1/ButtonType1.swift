//
//  ButtonType1.swift
//  UIComponentsFramework
//
//  Created by devops on 20/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public protocol IButtonType1:IButton{
}

public class ButtonType1: UIView {
    public let xibname:String="ButtonType1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var mytitle: UILabel!
    var vm:ButtonType1VM?{
        didSet{
            self.contentview.backgroundColor=vm!.contentColor ?? UIColor.white;
            self.mytitle.text=vm!.title;
            self.mytitle.textColor=vm!.textColor ?? UIColor.white;
            self.contentview.setupRadius(bgColor: vm!.contentColor!, radius: vm!.radius!)
        }
    }
    var handler:IButtonType1?;
    
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
    //initialize this on the component on where you wanna use
    public func setup(vm:ButtonType1VM, handler:IButtonType1){
        self.vm=vm;
        self.handler=handler;
    }
}
extension ButtonType1{
    func setupTapRecognizer(){
        contentview.setUIRecognizer(selector: #selector(onClick));
    }
    @objc
    func onClick(){
        handler?.onButtonClick(tag: self.vm!.tag!)
    }
}


public class ButtonType1VM:ButtonVMBase{
    public var radius:CGFloat?;
}
