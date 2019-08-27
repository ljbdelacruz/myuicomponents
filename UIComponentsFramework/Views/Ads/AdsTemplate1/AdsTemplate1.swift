//
//  AdsTemplate1.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public protocol IAdsTemplate1:IViewsBase{
    
}

public class AdsTemplate1: UIView {
    public let xibname:String="AdsTemplate1";
    @IBOutlet public var contentview: UIView!
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var mytitle: UILabel!
    @IBOutlet public weak var mySubDesc: UILabel!
    var handler:IAdsTemplate1?;
    
    var vm:AdsTemplate1VM?{
        didSet{
            self.myimage.image=vm!.image;
            self.mytitle.text=vm!.title;
            self.mySubDesc.text=vm!.subDesc;
            self.contentview.setupRadius(vm: vm!.contentDesign!)
            self.contentview.setMyShadow(vm: vm!.contentDesign!.shadow!);
            self.myimage.roundCorners(vm: vm!.imageDesign!)
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
    public func setup(vm:AdsTemplate1VM, handler:IAdsTemplate1){
        self.vm=vm;
        self.handler=handler;
        self.contentview.setUIRecognizer(selector: #selector(onClick))
    }
}
//MARK: setting up recognizer
extension AdsTemplate1{
    @objc
    func onClick(){
        self.handler?.onClick(tag: self.vm!.tag!);
    }
}

public class AdsTemplate1VM:ViewsBaseVM{
    public var imageDesign:ViewBaseDesignVM?;
    override init(){
        super.init();
        self.contentDesign=ViewBaseDesignVM();
        contentDesign?.borderColor=UIColor.init(white: 0, alpha: 0);
        contentDesign?.borderRadius=10;
        contentDesign?.shadow=ShadowModel();
        contentDesign?.shadow?.radius=10;
        contentDesign?.shadow?.width=1;
        contentDesign?.shadow?.height=1;
        contentDesign?.shadow?.opacity=1;
        imageDesign=ViewBaseDesignVM();
        imageDesign?.corners=[.topLeft, .topRight];
        imageDesign?.cornerRadius=10;
    }
}
