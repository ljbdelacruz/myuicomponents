//
//  Content2View.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class Content2View: UIView {
    public let xibname:String="Content2View";
    @IBOutlet public var contentview: UIView!
    @IBOutlet public weak var mytitle: UILabel!
    @IBOutlet public weak var mycontent: UITextView!
    override public init(frame: CGRect) {
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
