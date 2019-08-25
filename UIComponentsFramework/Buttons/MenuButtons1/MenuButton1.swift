//
//  MenuButton1.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 6/9/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public protocol IMenuButton1:IButton{
    
}

public class MenuButton1: UIView {
    public let xibname:String="MenuButtons1";
    @IBOutlet var contentview: UIView!
    @IBOutlet public weak var leftLogo: UIImageView!
    @IBOutlet public weak var rightLogo: UIImageView!
    @IBOutlet public weak var mylabel: UILabel!
    var vm:MenuButton1VM?{
        didSet{
            self.leftLogo.image=vm?.leftLogo
            self.rightLogo.image=vm?.rightLogo
            self.mylabel.text=vm?.title;
            self.mylabel.textColor=vm?.textColor ?? UIColor.white;
            self.contentview.tag=vm!.tag!;
        }
    }
    var handler:IMenuButton1?
    
    override public init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        commonInit()
    }
    public func commonInit(){
        Bundle.main.loadNibNamed(xibname, owner: self, options: nil)
        contentview.fixInView(self)
    }
    
    //set this on the callers
    public func set(vm:MenuButton1VM, handler:IMenuButton1){
        self.handler=handler;
        self.vm=vm;
    }
    
}
//MARK: click handler

extension MenuButton1{
    public func getRecog()->UITapGestureRecognizer{
        let recog = UITapGestureRecognizer(target: self, action: #selector(onClick))
        return recog;
    }
    func setupTapRecognizer(){
        contentview.addGestureRecognizer(self.getRecog());
    }
    @objc
    func onClick(){
        self.handler?.onButtonClick(tag: self.contentview.tag);
    }
}

public class MenuButton1VM:ButtonVMBase{
    public var leftLogo:UIImage?;
    public var rightLogo:UIImage?;
}

