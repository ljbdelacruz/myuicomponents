//
//  ButtonType1.swift
//  UIComponentsFramework
//
//  Created by devops on 20/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class ButtonType1: UIView {
    public let xibname:String="ButtonType1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var mytitle: UILabel!
    var vm:ButtonType1VM?{
        didSet{
            self.contentview.backgroundColor=vm!.contentColor ?? UIColor.white;
            self.mytitle.text=vm!.title;
            self.mytitle.textColor=vm!.textColor ?? UIColor.white;
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
    //initialize this on the component on where you wanna use
    public func setUI(vm:ButtonType1VM){
        self.vm=vm;
        self.setupRadius(bgColor: UIColor.mytransparent(), radius: 20);
    }
}

public class ButtonType1VM{
    public var contentColor:UIColor?;
    public var title:String?
    public var textColor:UIColor?
    
}
