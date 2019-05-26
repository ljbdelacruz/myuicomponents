//
//  AdvancePopup1.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/26/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class AdvancePopup1: UIView {
    public let xibname:String="PopupBasic2"
    @IBOutlet public var contentview: UIView!
    @IBOutlet public weak var bannerview: UIView!
    @IBOutlet public weak var mytitle: UILabel!
    @IBOutlet public weak var mytableview: UITableView!
    @IBOutlet public weak var mybutton: UIButton!
    public var eventOnClick: (() -> Void)?{
        didSet{
            self.setupTapRecognizer();
        }
    }
    
    
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
//MARK: setup recognizer
extension AdvancePopup1{
    public func getRecog()->UITapGestureRecognizer{
        let recog = UITapGestureRecognizer(target: self, action: #selector(onClick))
        return recog;
    }
    public func setupTapRecognizer(){
        mybutton.addGestureRecognizer(self.getRecog());
    }
    @objc
    func onClick(){
        eventOnClick?();
    }
}
