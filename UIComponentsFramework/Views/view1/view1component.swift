//
//  view1component.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/19/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import M13ProgressSuite


public class view1component: UIView {
    
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var value1: UILabel!
    @IBOutlet weak var of: UILabel!
    @IBOutlet weak var value2: UILabel!
    @IBOutlet weak var myprogresshud: M13ProgressViewBar!
    public let xibname:String="view1"
    
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
        self.myprogresshud.showPercentage=true;
        self.myprogresshud.progressBarCornerRadius=0.1;
        self.myprogresshud.failureColor=UIColor.red;
        self.myprogresshud.setProgress(50, animated: true);
    }

}

extension UIView
{
    public func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
