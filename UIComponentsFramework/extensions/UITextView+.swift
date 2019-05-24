//
//  UITextView+.swift
//  UIComponentsFramework
//
//  Created by devops on 22/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import UIKit

public extension UITextView{
    //this automatically adjust textview height based on its content
    public func adjustTextView(){
        let fixedWidth = self.frame.size.width
        let newSize = self.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        self.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
    }
}
