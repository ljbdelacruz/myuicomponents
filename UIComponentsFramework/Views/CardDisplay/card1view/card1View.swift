//
//  card1View.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/24/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class card1View: UIView {
    public let xibname:String="card1View";
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
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
        containerView.fixInView(self)
        self.cardName.text="";
        self.cardNumber.text="";
    }
    
    
}
//MARK: card recog
extension card1View{
    public func getRecog()->UITapGestureRecognizer{
        let recog = UITapGestureRecognizer(target: self, action: #selector(onClick))
        return recog;
    }
    public func setupTapRecognizer(){
        containerView.addGestureRecognizer(self.getRecog());
    }
    @objc
    func onClick(){
        eventOnClick?();
    }
}
