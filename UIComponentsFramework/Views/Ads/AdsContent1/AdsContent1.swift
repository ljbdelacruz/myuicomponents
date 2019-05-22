//
//  AdsContent1.swift
//  UIComponentsFramework
//
//  Created by devops on 22/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class AdsContent1: UIView {
    public let xibname:String="AdsContent1";
    @IBOutlet public var contentview: UIView!
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var button1: UIButton!
    @IBOutlet public weak var button2: UIButton!
    //eventClickHandler
    public var button1OnClick: (() -> Void)?
    public var button2OnClick: (() -> Void)?
    
    //Constraints controls
    @IBOutlet public weak var button1HC: NSLayoutConstraint!
    @IBOutlet public weak var button1WC: NSLayoutConstraint!
    @IBOutlet public weak var button2HC: NSLayoutConstraint!
    @IBOutlet public weak var button2WC: NSLayoutConstraint!
    
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
//MARK: Recognizer
extension AdsContent1{
    public func getRecog(type:Int)->UITapGestureRecognizer{
        switch type {
            case 2:
                let recog = UITapGestureRecognizer(target: self, action: #selector(onClick2))
                return recog;
        default:
            let recog = UITapGestureRecognizer(target: self, action: #selector(onClick1))
            return recog;
        }
    }
    public func setupTapRecognizer(){
        button1.addGestureRecognizer(getRecog(type:1));
        button2.addGestureRecognizer(getRecog(type:2));
    }
    
    @objc
    func onClick1(){
        button1OnClick?();
    }
    @objc
    func onClick2(){
        button2OnClick?();
    }

}
