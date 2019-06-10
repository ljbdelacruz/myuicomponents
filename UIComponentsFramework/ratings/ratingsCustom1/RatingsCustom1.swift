//
//  RatingsCustom1.swift
//  UIComponentsFramework
//
//  Created by devops on 10/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public protocol RatingsCustomHandler{
    func onClick();
}

public class RatingsCustom1: UIView {
    public let xibname:String="RatingsCustom1";
    private let imgFullStar:String="star";
    private let imgHalfStar:String="half-star-shape";
    public var handler:RatingsCustomHandler?;
    
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var imgStar1: UIImageView!
    @IBOutlet weak var imgStar2: UIImageView!
    @IBOutlet weak var imgStar3: UIImageView!
    @IBOutlet weak var imgStar4: UIImageView!
    @IBOutlet weak var imgStar5: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    public var ratings:Int=0;
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
    public func setRatings(){
        self.imgStar1.isHidden = self.ratings >= 1 ? false : true;
        self.imgStar2.isHidden = self.ratings >= 2 ? false : true;
        self.imgStar3.isHidden = self.ratings >= 3 ? false : true;
        self.imgStar4.isHidden = self.ratings >= 4 ? false : true;
        self.imgStar4.isHidden = self.ratings >= 5 ? false : true;
    }
}

extension RatingsCustom1{
    func setClickListener(){
        contentview.setUIRecognizer(selector: #selector(onClick))
    }
    @objc
    func onClick(){
        handler!.onClick();
    }
}
