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
