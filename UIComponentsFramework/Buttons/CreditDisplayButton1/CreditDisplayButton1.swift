//
//  CreditDisplayButton1.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 6/9/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class CreditDisplayButton1: UIView {
    public let xibname:String="CreditsDisplayButton1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var content1: UILabel!
    @IBOutlet weak var content2: UILabel!
    
    
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
    func setContainerCorner(){
        let transparent=UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0);
        //setting up specific corners of the view radius
        container.roundCorners(corners: [.bottomRight, .topRight], radius: 20)
        container.setMyShadow(radius: 3.0, width: 1.0, height: 1.0, opacity: 0.1);
    }
    

}
