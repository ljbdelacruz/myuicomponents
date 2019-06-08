//
//  t3ImageDisplay.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 6/8/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class t3ImageDisplay: UIView {
    public let xibname:String="3ImageDisplay";
    
    @IBOutlet var contentview: UIView!
    @IBOutlet public weak var primaryImage: UIImageView!
    @IBOutlet public weak var secondaryImage: UIImageView!
    @IBOutlet public weak var tertiaryImage: UIImageView!
    
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
