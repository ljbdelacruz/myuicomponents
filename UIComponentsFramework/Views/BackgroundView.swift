//
//  BackgroundView.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class BackgroundView: UIView {
    public var bgColorHex:String="";
    
    
    
    public func setupBackground(view:UIView){
        view.addSubview(self);
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: 0);
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0);
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0);
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0);
        self.backgroundColor=UiUtil.hexStringToUIColor(hex: self.bgColorHex);
    }
}
