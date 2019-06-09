//
//  MenuButton1.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 6/9/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class MenuButton1: UIView {
    public let xibname:String="MenuButtons1";
    
    @IBOutlet var contentview: UIView!
    @IBOutlet public weak var leftLogo: UIImageView!
    @IBOutlet public weak var rightLogo: UIImageView!
    @IBOutlet public weak var mylabel: UILabel!
    public var eventOnClick: (() -> Void)?{
        didSet{
            self.setupTapRecognizer();
        }
    }
    
    
    override public init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        commonInit()
    }
    public func commonInit(){
        Bundle.main.loadNibNamed(xibname, owner: self, options: nil)
        contentview.fixInView(self)
    }
}
//MARK: click handler

extension MenuButton1{
    public func getRecog()->UITapGestureRecognizer{
        let recog = UITapGestureRecognizer(target: self, action: #selector(onClick))
        return recog;
    }
    func setupTapRecognizer(){
        contentview.addGestureRecognizer(self.getRecog());
    }
    @objc
    func onClick(){
        eventOnClick?();
    }
}

