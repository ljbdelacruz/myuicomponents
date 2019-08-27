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
    public func setupRadius(vm:ViewBaseDesignVM){
        self.setupRadius(bgColor: vm.borderColor!, radius: vm.borderRadius!)
    }
    
    //[.topLeft, .topRight]
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    public func roundCorners(vm:ViewBaseDesignVM){
        self.roundCorners(corners: vm.corners!, radius: vm.cornerRadius!)
    }
    
    
    
    //setting up shadow for uiview
    public func setMyShadow(radius:CGFloat, width:CGFloat, height:CGFloat, opacity:Float){
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius;
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height);
        self.layer.shadowOpacity = opacity;
    }
    public func setMyShadow(vm:ShadowModel){
        self.setMyShadow(radius: vm.radius!, width: vm.width!, height: vm.height!, opacity: vm.opacity!)
    }
    
    //MARK: setup recognizer
    //setup recognizer for this uiview
    public func setUIRecognizer(selector:Selector?){
        let recog = UITapGestureRecognizer(target: self, action:selector!);
        self.addGestureRecognizer(recog);
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



@IBDesignable
extension UIView {
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var shadow: Bool {
        set {
            if shadow {
                layer.shadowColor = UIColor.black.cgColor
                layer.shadowOpacity = 0.1
                layer.shadowOffset = CGSize(width: 0, height: 1)
                layer.shadowRadius = 2
                layer.masksToBounds = false
            }
        }
        get {
            return layer.shadowColor != nil
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
}
