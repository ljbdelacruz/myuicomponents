//
//  RatingsCustom1.swift
//  UIComponentsFramework
//
//  Created by devops on 10/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public protocol IRatingsCustom1:IViewsBase{
}

public class RatingsCustom1: UIView {
    public let xibname:String="RatingsCustom1";
    var handler:IRatingsCustom1?;
    var vm:RatingsCustom1VM?{
        didSet{
            self.descLabel.text=vm!.title;
            self.imgStar1.image=vm!.imageFullStar!;
            self.imgStar2.image=vm!.imageFullStar!;
            self.imgStar3.image=vm!.imageFullStar!;
            self.imgStar4.image=vm!.imageFullStar!;
            self.imgStar5.image=vm!.imageFullStar!;
            self.setRatings();
        }
    }
    
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var imgStar1: UIImageView!
    @IBOutlet weak var imgStar2: UIImageView!
    @IBOutlet weak var imgStar3: UIImageView!
    @IBOutlet weak var imgStar4: UIImageView!
    @IBOutlet weak var imgStar5: UIImageView!
    @IBOutlet weak var descLabel: UILabel!

    
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
        self.setRatings();
    }
    public func setup(vm:RatingsCustom1VM, handler:IRatingsCustom1){
        self.vm=vm;
        self.handler=handler;
    }
    
    public func setRatings(){
        self.imgStar1.isHidden = self.vm!.ratings! >= 1 ? false : true;
        self.imgStar2.isHidden = self.vm!.ratings! >= 2 ? false : true;
        self.imgStar3.isHidden = self.vm!.ratings! >= 3 ? false : true;
        self.imgStar4.isHidden = self.vm!.ratings! >= 4 ? false : true;
        self.imgStar5.isHidden = self.vm!.ratings! >= 5 ? false : true;
    }
}

extension RatingsCustom1{
    func setupTapRecognizer(){
        contentview.setUIRecognizer(selector: #selector(onClick));
    }
    @objc
    func onClick(){
        handler!.onClick(tag: vm!.tag!);
    }
}

public class RatingsCustom1VM:ViewsBaseVM{
    public var ratings:Int?;
    public var imageFullStar:UIImage?
    public var imageHalfStar:UIImage?
    override init(){
        super.init();
        self.imageFullStar=UIImage(named:"star");
        self.imageHalfStar=UIImage(named:"half-star-shape");
    }
    
}
