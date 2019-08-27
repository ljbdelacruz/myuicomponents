//
//  AdsDescription1.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public protocol IAdsDescription1:IViewsBase{
    func ratingsOnClick(tag:Int)
}

public class AdsDescription1: UIView {
    public let xibname:String="AdsDescription1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var mytitle: UILabel!
    @IBOutlet weak var myPrice: UILabel!
    @IBOutlet weak var perMonth: UILabel!
    @IBOutlet weak var textContent: UITextView!
    @IBOutlet weak var myratings: RatingsCustom1!
    var handler:IAdsDescription1?;
    var vm:AdsDescription1VM?{
        didSet{
            self.mytitle.text=vm!.title
            self.myPrice.text=vm!.price;
            self.perMonth.text=vm!.perMonth;
            self.textContent.text=vm!.subDesc;
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
    func setup(vm:AdsDescription1VM, handler:IAdsDescription1){
        self.vm=vm;
        self.handler=handler;
        self.myratings.setUIRecognizer(selector: #selector(ratingsOnClick))
    }
    
    
}
//MARK: Click Handler
extension AdsDescription1{
    @objc
    func ratingsOnClick(){
        self.handler?.onClick(tag: self.vm!.tag!)
    }
}
extension AdsDescription1:IRatingsCustom1{
    public func onClick(tag:Int) {
        self.handler?.ratingsOnClick(tag: self.vm!.tag!)
    }
}

public class AdsDescription1VM:ViewsBaseVM{
    public var price:String?;
    public var priceDesign:ViewBaseDesignVM?
    public var perMonth:String?
    public var perMonthDesign:ViewBaseDesignVM?;
    public var ratings:RatingsCustom1VM?
}
