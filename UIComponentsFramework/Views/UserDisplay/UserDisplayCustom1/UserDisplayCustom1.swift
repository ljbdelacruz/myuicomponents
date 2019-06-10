//
//  UserDisplayCustom1.swift
//  UIComponentsFramework
//
//  Created by devops on 10/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class UserDisplayCustom1: UIView {
    public let xibname:String="UserDisplayCustom1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var rightButton: UIImageView!
    @IBOutlet weak var nameDesc: UILabel!
    @IBOutlet weak var subDesc: UILabel!
    
    public var eventOnClick: (() -> Void)?{
        didSet{
            self.setRecognizer();
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
    func setImage(){
        self.profileImage.setRounded();
        self.rightButton.setRounded();
    }
    func setRecognizer(){
        rightButton.setUIRecognizer(selector: #selector(onClick))
    }
    @objc
    func onClick(){
    }
    
    
}
