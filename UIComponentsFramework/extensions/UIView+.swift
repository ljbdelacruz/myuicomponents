//
//  UIView+.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    //setup for nib init
    public func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    //setup for rounded corners
    public func setupRadius(bgColor:UIColor, radius:CGFloat){
        self.backgroundColor=bgColor;
        self.layer.cornerRadius=radius;
        self.clipsToBounds = true
    }
}


//MARK: Animations
extension UIView{
    //animate from up down
    public func animPushUp(animDur:TimeInterval){
        self.frame.origin.y = self.frame.origin.y - 200;
        self.alpha=0;
        UIView.animate(withDuration: animDur, animations: {
            self.alpha=1;
            self.frame.origin.y = self.frame.origin.y + 200;
        })
    }
}
