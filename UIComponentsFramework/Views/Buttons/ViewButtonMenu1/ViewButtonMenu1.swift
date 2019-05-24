//
//  ViewButtonMenu1.swift
//  UIComponentsFramework
//
//  Created by devops on 24/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
public class ViewButtonMenu1: UIView {
    public let xibname:String="ViewButtonMenu1";
    @IBOutlet public var containerview: UIView!
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var myDesc: UITextView!
    public var eventOnClick: (() -> Void)?
    
    public var titleDesc:String {
        didSet{
            myDesc.text = titleDesc;
            myDesc.adjustTextView()
        }
    }
    override public init(frame: CGRect){
        self.titleDesc="";
        super.init(frame: frame)
        commonInit()
    }
    required public init?(coder aDecoder: NSCoder) {
        self.titleDesc="";
        super.init(coder: aDecoder)
        commonInit()
    }
    public func commonInit() {
        Bundle.main.loadNibNamed(xibname, owner: self, options: nil)
        containerview.fixInView(self)
    }
    public func setupAdjust(){
        myDesc.adjustTextView()
    }
}
extension ViewButtonMenu1{
    func getRecog()->UITapGestureRecognizer{
        let recog = UITapGestureRecognizer(target: self, action: #selector(onClick))
        return recog;
    }
    public func setupGestures(){
        self.containerview.addGestureRecognizer(self.getRecog());
    }
    @objc func onClick(){
        eventOnClick?();
    }
}
