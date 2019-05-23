//
//  UnderlinedTextFields.swift
//  UIComponentsFramework
//
//  Created by devops on 23/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
public class UnderlinedTextFields: UIView {
    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var underlineViewHeightConstraint: NSLayoutConstraint!
    
    @IBInspectable var fieldName: String? {
        set(text) {
            fieldNameLabel.text = text
        }
        get {
            return fieldNameLabel.text
        }
    }
    
    @IBInspectable var fieldNameColor: UIColor? {
        set(color) {
            fieldNameLabel.textColor = color
        }
        get {
            return fieldNameLabel.textColor
        }
    }
    
    @IBInspectable var text: String? {
        set(text) {
            textField.text = text
            editingChanged(textField)
            
            textFieldDidEndEditing(textField)
        }
        get {
            return textField.text
        }
    }
    
    @IBInspectable var placeholder: String? {
        set(placeholder) {
            textField.placeholder = placeholder
        }
        get {
            return textField.placeholder
        }
    }
    
    @IBInspectable var underlineColor: UIColor? {
        set(color) {
            underlineView.backgroundColor = color
        }
        get {
            return underlineView.backgroundColor
        }
    }
    
    private var _animateHint: Bool = true
    @IBInspectable var animateHint: Bool {
        set(animate) {
            _animateHint = animate
        }
        get {
            return _animateHint
        }
    }
    
    @IBInspectable var keyboardType: UIKeyboardType {
        set(type) {
            textField.keyboardType = type
        }
        get {
            return textField.keyboardType
        }
        
    }
    
    var defaultUnderlineColor: UIColor!
    var highlightedCaption: UILabel?
    
    @objc func editingChanged(_ textField: UITextField) {
        
        guard animateHint else {
            return
        }
        
        if !(textField.text == "") && fieldNameLabel.isHidden {
            fieldNameLabel.isHidden = false
            fieldNameLabel.textColor = AppColor.primary.uiColor
            fieldNameLabel.text = textField.placeholder
            
            fieldNameLabel.transform = CGAffineTransform(translationX: 0, y: 10)
            fieldNameLabel.alpha = 0
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.fieldNameLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.fieldNameLabel.alpha = 1
            })
            
        } else if (textField.text == "") {
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.fieldNameLabel.transform = CGAffineTransform(translationX: 0, y: 10)
                self.fieldNameLabel.alpha = 0
            }, completion: { (finished) in
                self.fieldNameLabel.isHidden = true
            })
            
        }
        
        layoutIfNeeded()
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupDefaults()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupDefaults()
    }
    
    // MARK: - Private Helper Methods
    private func setupDefaults() {
        textField.delegate = self
        defaultUnderlineColor = underlineView.backgroundColor
        textField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        fieldNameLabel.isHidden = true
        
        //        textField.addObserver(self, forKeyPath: "text", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
    }
    
    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (object as! UITextField) == self.textField, keyPath == "text" {
            editingChanged(self.textField)
        }
    }
    
    
    // Performs the initial setup.
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        
        // Auto-layout stuff.
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        
        // Show the view.
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    private func viewFromNibForClass() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
}

extension UnderlinedTextFields: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        underlineColor = AppColor.primary.uiColor
        highlightedCaption?.textColor = underlineColor
        fieldNameLabel.textColor = AppColor.primary.uiColor
        underlineViewHeightConstraint.constant = 2
        fieldNameLabel.textColor = AppColor.primary.uiColor
        layoutIfNeeded()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        underlineColor = UIColor.black.withAlphaComponent(0.20)
        highlightedCaption?.textColor = underlineColor
        fieldNameLabel.textColor = UIColor.black.withAlphaComponent(0.54)
        underlineViewHeightConstraint.constant = 1.2
        fieldNameLabel.textColor = UIColor.black.withAlphaComponent(0.54)
        layoutIfNeeded()
    }
    
}
