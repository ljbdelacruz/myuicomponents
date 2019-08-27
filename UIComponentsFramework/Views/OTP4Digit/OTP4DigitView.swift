//
//  OTP4DigitView.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public protocol OTP4DigitHandler{
    func submit4Digit(otp:String);
}

public class OTP4DigitView: UIView {
    public let xibname:String="OTP4DigitView";
    public var otp:String="";
    
    //set callback for this first
    public var callback:OTP4DigitHandler?;
    
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var autoTF1: AutoTextField!
    @IBOutlet weak var autoTF2: AutoTextField!
    @IBOutlet weak var autoTF3: AutoTextField!
    @IBOutlet weak var autoTF4: AutoTextField!
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
        self.setupTF();
    }
}
extension OTP4DigitView:AutoTextFieldDelegate{
    public func didDetectBackspace(for autoTextField: AutoTextField) {
        guard (autoTextField.text?.isEmpty)! else {
            return
        }
        switch autoTextField {
        case autoTF1:
            break
        case autoTF2:
            autoTF1.becomeFirstResponder()
        case autoTF3:
            autoTF2.becomeFirstResponder()
        case autoTF4:
            autoTF3.becomeFirstResponder()
        default:
            break
        }
        return
    }
    
    func setupTF(){
        let selector = #selector(textFieldHandler(_:))
        autoTF1.becomeFirstResponder()
        autoTF1.addTarget(self, action: selector, for: .editingChanged)
        autoTF2.addTarget(self, action: selector, for: .editingChanged)
        autoTF3.addTarget(self, action: selector, for: .editingChanged)
        autoTF4.addTarget(self, action: selector, for: .editingChanged)
        autoTF1.autoTextFieldDelegate = self
        autoTF2.autoTextFieldDelegate = self
        autoTF3.autoTextFieldDelegate = self
        autoTF4.autoTextFieldDelegate = self
        autoTF1.isSecureTextEntry = true
        autoTF2.isSecureTextEntry = true
        autoTF3.isSecureTextEntry = true
        autoTF4.isSecureTextEntry = true

        
    }
    @objc func textFieldHandler(_ sender: UITextField) {
        guard sender.text?.count != 0 else {
            return
        }
        switch sender {
        case autoTF1:
            autoTF2.becomeFirstResponder()
        case autoTF2:
            autoTF3.becomeFirstResponder()
        case autoTF3:
            autoTF4.becomeFirstResponder()
        case autoTF4:
            let otp = autoTF1.text! + autoTF2.text! + autoTF3.text! + autoTF4.text!
            self.otp = otp
            enableTextFields(true)
            self.callback!.submit4Digit(otp:otp);
            self.clearTextFields();
        default: break
        }
    }
    func enableTextFields(_ yes: Bool) {
        autoTF1.isEnabled = yes
        autoTF2.isEnabled = yes
        autoTF3.isEnabled = yes
        autoTF4.isEnabled = yes
    }
    public func clearTextFields(){
        autoTF1.clear()
        autoTF2.clear()
        autoTF3.clear()
        autoTF4.clear()
        autoTF1.becomeFirstResponder()
    }
}



