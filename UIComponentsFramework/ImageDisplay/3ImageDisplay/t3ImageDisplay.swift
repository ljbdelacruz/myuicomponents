//
//  t3ImageDisplay.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 6/8/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit


public protocol It3ImageDisplay{
    func primaryImageClick(image:UIImage, tag:Int)
    func secondaryImageClick(image:UIImage, tag:Int)
    func tertiaryImageClick(image:UIImage, tag:Int)
}

public class t3ImageDisplay: UIView {
    public let xibname:String="3ImageDisplay";
    @IBOutlet var contentview: UIView!
    @IBOutlet public weak var primaryImage: UIImageView!
    @IBOutlet public weak var secondaryImage: UIImageView!
    @IBOutlet public weak var tertiaryImage: UIImageView!
    var handler:It3ImageDisplay?
    var vm:t3ImageDisplayVM?{
        didSet{
            self.primaryImage.image=vm!.pImage;
            self.secondaryImage.image=vm!.sImage;
            self.tertiaryImage.image=vm!.tImage;
        }
    }
    
    override public init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        //set image to rounded please create implementation
    }
    public func commonInit() {
        Bundle.main.loadNibNamed(xibname, owner: self, options: nil)
        contentview.fixInView(self)
    }
    public func setup(vm:t3ImageDisplayVM, handler:It3ImageDisplay){
        self.vm=vm;
        self.handler=handler;
    }
    

}
extension t3ImageDisplay{
    func setupTapRecognizer(){
        primaryImage.setUIRecognizer(selector: #selector(ponClick))
    }
    @objc
    func ponClick(){
        handler!.primaryImageClick(image: vm!.pImage!, tag: vm!.tag!);
    }
}


public class t3ImageDisplayVM{
    public var pImage:UIImage?;
    public var sImage:UIImage?;
    public var tImage:UIImage?;
    public var tag:Int?;
}
