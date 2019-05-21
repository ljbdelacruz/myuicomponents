//
//  AutoTextFields.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
public protocol  AutoTextFieldDelegate {
    func didDetectBackspace(for autoTextField: AutoTextField)
}
public class AutoTextField: UITextField {
    public var autoTextFieldDelegate: AutoTextFieldDelegate?
    override public func deleteBackward() {
        super.deleteBackward()
        autoTextFieldDelegate?.didDetectBackspace(for: self)
    }
}
