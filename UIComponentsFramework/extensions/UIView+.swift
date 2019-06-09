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
    //[.topLeft, .topRight]
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
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
    
    
    public func setMyShadow(){
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0);
        self.layer.shadowOpacity = 1.0
    }
}
