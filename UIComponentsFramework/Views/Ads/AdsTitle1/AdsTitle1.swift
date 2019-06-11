//
//  AdsTitle1.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class AdsTitle1: UIView {
    public let xibname:String="AdsTitle1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var mytitle: UILabel!
    @IBOutlet weak var ratingsUI: RatingsCustom1!
    @IBOutlet weak var rightButton: UIImageView!
    public var rightEvent: (() -> Void)?{
        didSet{
            rightButton.setUIRecognizer(selector: #selector(rightOnClick));
        }
    }
    public var ratingsEvent: (() -> Void)?{
        didSet{
            ratingsUI.setUIRecognizer(selector: #selector(ratingsOnClick))
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
}
//click handler

extension AdsTitle1{
    @objc
    func rightOnClick(){
        rightEvent?();
    }
    @objc
    func ratingsOnClick(){
        ratingsEvent?();
    }
}
