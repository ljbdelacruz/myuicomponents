//
//  AdsContent2View.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/25/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class AdsContent2View: UIView {
    public let xibname:String="AdsContent1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    public var eventOnClick: (() -> Void)?{
        didSet{
            self.setupTapRecognizer();
        }
    }
    
    override public init(frame: CGRect){
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

//MARK: Recognizer
extension AdsContent2View{
    public func getRecog(type:Int)->UITapGestureRecognizer{
        let recog = UITapGestureRecognizer(target: self, action: #selector(onClick1))
        return recog;
    }
    public func setupTapRecognizer(){
    }
    
    @objc
    func onClick1(){
        eventOnClick?();
    }
    
    
}
