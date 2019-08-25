//
//  CreditDisplayButton1.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 6/9/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public protocol ICreditDisplayButton1:IButton{
    
}
public class CreditDisplayButton1: UIView {
    public let xibname:String="CreditsDisplayButton1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var content1: UILabel!
    @IBOutlet weak var content2: UILabel!
    var vm:CreditDisplayButton1VM?{
        didSet{
            self.contentview.backgroundColor=vm?.contentColor;
            self.content1.text=vm!.title;
            self.content1.textColor=vm?.textColor;
            self.content2.text=vm!.subDesc;
            self.content2.textColor=vm?.textColor;
            self.container.roundCorners(corners: vm!.corners!, radius: vm!.radius!)
            container.setMyShadow(radius: vm!.shadowModel!.radius!, width: vm!.shadowModel!.width!, height: vm!.shadowModel!.height!, opacity: vm!.shadowModel!.opacity!);
        }
    }
    var handler:ICreditDisplayButton1?;
    
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
    func setup(vm:CreditDisplayButton1VM, handler:ICreditDisplayButton1){
        self.vm=vm;
        self.handler=handler;
    }
}
public class CreditDisplayButton1VM:ButtonVMBase{
    public var subDesc:String?
    public var corners:UIRectCorner?=[.bottomRight, .topRight]
    public var radius:CGFloat?=20;
    override init(){
        super.init()
        self.shadowModel=ShadowModel();
        shadowModel?.set(radius: 3.0, width: 1.0, height: 1.0, opacity: 0.1)
    }
    
    
}



