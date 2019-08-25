//
//  CategoryButton1.swift
//  UIComponentsFramework
//
//  Created by devops on 10/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit


public protocol ICategoryButton1:IButton{
}

public class CategoryButton1: UIView {
    public let xibname:String="CategoryButton1";
    @IBOutlet var contentview: UIView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var descTitle: UILabel!
    @IBOutlet weak var subDesc: UILabel!
    public var vm:CategoryButton1VM?{
        didSet{
            self.myImage.image=vm?.image;
            self.descTitle.text=vm?.title;
            self.subDesc.text=vm?.subDesc;
        }
    };
    var handler:ICategoryButton1?;
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
    func setup(vm:CategoryButton1VM, handler:ICategoryButton1){
        self.vm=vm;
        self.handler=handler;
        self.setupTapRecognizer();
    }
}
//MARK: set recognizer
extension CategoryButton1{
    func setupTapRecognizer(){
        contentview.setUIRecognizer(selector: #selector(onClick));
    }
    @objc
    func onClick(){
        handler?.onButtonClick(tag: self.vm!.tag!)
    }
}

public class CategoryButton1VM:ButtonVMBase{
    public var image:UIImage?;
    public var subDesc:String?
}
