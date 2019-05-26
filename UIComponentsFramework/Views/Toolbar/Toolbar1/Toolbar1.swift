//
//  Toolbar1.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import UIKit
public class Toolbar1: UIView {
    public let xibname:String="Toolbar1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var rightButton: UIButton!
    private var isRecogSet=false;
    public var leftActionButton: (() -> Void)?{
        didSet{
            self.setupTapRecognizer();
        }
    }
    public var rightActionButton: (() -> Void)?{
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
    
    @IBAction func rightButtonOnClick(_ sender: Any) {
        rightActionButton?();
    }
    @IBAction func leftButtonOnClick(_ sender: Any) {
        leftActionButton?();
    }
}

//MARK: recognizer
extension Toolbar1{
    public func getRecog(type:Int)->UITapGestureRecognizer{
        switch type{
        case 1:
            let recog = UITapGestureRecognizer(target: self, action: #selector(rightOnClick))
            return recog;
        default:
            let recog = UITapGestureRecognizer(target: self, action: #selector(leftOnClick))
            return recog;
        }
    }
    public func setupTapRecognizer(){
        if !self.isRecogSet{
            if !self.isRecogSet{
                leftButton.addGestureRecognizer(self.getRecog(type:1));
                rightButton.addGestureRecognizer(self.getRecog(type: 2))
            }
        }
        self.isRecogSet=true;
    }
    @objc
    func leftOnClick(){
        leftActionButton?();
    }
    @objc
    func rightOnClick(){
        
    }
}
