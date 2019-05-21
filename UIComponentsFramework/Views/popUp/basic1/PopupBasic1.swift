//
//  PopupBasic1.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class PopupBasic1: UIView {
    //MARK: Variables
    public let xibname:String="PopupBasic1"
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var popupContainer: UIView!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myDescription: UITextView!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    public var firstActionButton: (() -> Void)?
    public var secondActionButton: (() -> Void)?
    
    //MARK: Event Handler
    @IBAction func firstButtonOnClick(_ sender: Any){
        firstActionButton?();
    }
    @IBAction func secondButtonOnClick(_ sender: Any) {
        secondActionButton?();
    }
    
    
    
    //MARK: initialization
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
    }

}
