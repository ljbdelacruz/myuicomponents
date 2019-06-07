//
//  Button+.swift
//  UIComponentsFramework
//
//  Created by devops on 07/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

extension UIButton{
    //0.5 = 50%;
    public func setCornersToRounded(radius:CGFloat){
        self.frame = CGRect(origin: self.frame.origin, size: self.frame.size);
        self.layer.cornerRadius = radius * self.bounds.size.width;
        self.clipsToBounds = true;
    }
    
}
