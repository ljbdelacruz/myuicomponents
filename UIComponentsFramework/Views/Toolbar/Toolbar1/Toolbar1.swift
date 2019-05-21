//
//  Toolbar1.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class Toolbar1: UIView {
    public let xibname:String="Toolbar1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var rightButton: UIButton!
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
