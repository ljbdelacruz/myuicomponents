//
//  AdsTemplate1.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class AdsTemplate1: UIView {
    public let xibname:String="AdsTemplate1";
    @IBOutlet public var contentview: UIView!
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var mytitle: UILabel!
    @IBOutlet public weak var mySubDesc: UILabel!
    public var eventOnClick: (() -> Void)?{
        didSet{
            contentview.setUIRecognizer(selector: #selector(onClick))
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
        //setting rounded corners
        contentview.setupRadius(bgColor: UIColor.init(white: 0, alpha: 0), radius: 10);
        //setting shadow 
        contentview.setMyShadow(radius: 10, width: 1, height: 1, opacity: 1);
        //setting image top rounded corners
        myimage.roundCorners(corners: [.topLeft, .topRight], radius: 10);
        
    }
}
//MARK: setting up recognizer
extension AdsTemplate1{
    @objc
    func onClick(){
        eventOnClick?();
    }
}
