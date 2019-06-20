//
//  UITextField+.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import UIKit


extension UITextField{
    public func clear() {
        self.text = ""
    }
    public func changePlaceholderColor(color:UIColor){
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
                                                        attributes: [NSAttributedString.Key.foregroundColor: color])
    }

}


//MARK: Border Settings
extension UITextField{
    public func setBorder(){
        var width:CGFloat = 1;
        self.borderColor = UIColor.lightGray;
        var rect = CGRect(x: 0, y:self.frame.size.height - width, width:self.frame.size.width, height:self.frame.size.height);
        self.borderRect(forBounds: rect);
        self.borderWidth=width;
        self.layer.masksToBounds=true;
    }
    public func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
