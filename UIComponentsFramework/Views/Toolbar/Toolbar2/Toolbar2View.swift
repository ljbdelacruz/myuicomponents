//
//  Toolbar2View.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/26/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class Toolbar2View: UIView {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var rightButton1: UIButton!
    @IBOutlet weak var rightButton2: UIButton!
    public let xibname:String="Toolbar2View";
    private var isRecogSet:Bool=false;
    public var rightOnClick: (() -> Void)?{
        didSet{
            self.setupTapRecognizer();
        }
    }
    public var leftOnClick: (() -> Void)?{
        didSet{
            self.setupTapRecognizer();
        }
    }
    public var left1OnClick: (() -> Void)?{
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
        contentView.fixInView(self)
    }
}
//MARK: setup recognizer
extension Toolbar2View{
    public func getRecog(type:Int)->UITapGestureRecognizer{
        switch type{
        case 1:
            let recog = UITapGestureRecognizer(target: self, action: #selector(rightClick))
            return recog;
        case 2:
            let recog = UITapGestureRecognizer(target: self, action: #selector(leftClick))
            return recog;
        default:
            let recog = UITapGestureRecognizer(target: self, action: #selector(leftClick1))
            return recog;
        }
    }
    public func setupTapRecognizer(){
        if !self.isRecogSet{
            leftButton.addGestureRecognizer(self.getRecog(type:1));
            rightButton1.addGestureRecognizer(self.getRecog(type: 2))
            rightButton2.addGestureRecognizer(self.getRecog(type: 3))
        }
        self.isRecogSet=true;
    }
    @objc
    func rightClick(){
        rightOnClick?();
    }
    @objc
    func leftClick(){
        leftOnClick?()
    }
    @objc
    func leftClick1(){
        leftOnClick?();
    }
    
}

