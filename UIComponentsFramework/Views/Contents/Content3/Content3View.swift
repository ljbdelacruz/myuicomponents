//
//  Content3View.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/21/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class Content3View: UIView {
    public let xibname:String="Content3View";
    @IBOutlet public var contentview: UIView!
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var mycontent: UILabel!
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
        self.mycontent.text="";
    }
}

//MARK: setup tap recognizer
extension Content3View{
    public func getRecog()->UITapGestureRecognizer{
        let recog = UITapGestureRecognizer(target: self, action: #selector(onClick))
        return recog;
    }
    public func setupTapRecognizer(){
        contentview.addGestureRecognizer(self.getRecog());
    }
    @objc
    func onClick(){
        eventOnClick?();
    }
}
