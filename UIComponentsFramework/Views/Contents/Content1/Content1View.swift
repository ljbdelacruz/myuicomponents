//
//  Content1View.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class Content1View: UIView {
    public let xibname:String="Content1View";
    @IBOutlet public var contentview: UIView!
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var mylabel: UILabel!
    @IBOutlet public weak var mycontent: UILabel!
    public var eventOnClick: (() -> Void)?
    
    
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
        self.mylabel.text="";
        self.mycontent.text="";
    }
    public func unsetImage(){
        mylabel.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: contentview.trailingAnchor, constant: 1);
    }
}

extension Content1View{
    public func getRecog()->UITapGestureRecognizer{
        let recog = UITapGestureRecognizer(target: self, action: #selector(onClick))
        return recog;
    }
    public func setupTapRecognizer(){
        myimage.isUserInteractionEnabled=true;
        mylabel.isUserInteractionEnabled=true;
        mycontent.isUserInteractionEnabled=true;
        myimage.addGestureRecognizer(self.getRecog());
        mylabel.addGestureRecognizer(self.getRecog());
        mycontent.addGestureRecognizer(self.getRecog());
        
    }
    @objc
    func onClick(){
        eventOnClick?();
    }
}
