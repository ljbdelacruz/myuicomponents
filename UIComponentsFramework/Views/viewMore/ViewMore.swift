//
//  ViewMore.swift
//  UIComponentsFramework
//
//  Created by devops on 23/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

protocol ViewMoreDelegate: class {
    func viewMoreTapped(state: ViewMore.State)
}
public class ViewMore: UIView {
    public let xibname:String="ViewMore"
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var viewMoreStaticLabel: UILabel!
    @IBOutlet var contentview: UIView!
    
    
    enum State {
        case active
        case inactive
        
        var image: UIImage {
            switch self {
            case .active:
                return #imageLiteral(resourceName: "ic_keyboard_arrow_up_36pt")
            case .inactive:
                return #imageLiteral(resourceName: "ic_keyboard_arrow_down_36pt")
            }
        }
        
    }
    var _state: State = .inactive
    
    var state: State? {
        set {
            _state = newValue!
            arrow.image = newValue?.image
        }
        get {
            return _state
        }
    }
    
    var didTapAction: ((State) -> Void)?
    
    var delegate: ViewMoreDelegate?
    
    // MARK: - Actions
    @objc func tapAction() {
        switch state! {
        case .active:
            state = .inactive
        case .inactive:
            state = .active
        }
        didTapAction?(state!)
        delegate?.viewMoreTapped(state: state!)
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupDefaults()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupDefaults()
    }
    
    // MARK: - Private Helper Methods
    private func setupDefaults() {
        viewMoreStaticLabel.text = "View More"
        arrow.tintColor = AppColor.accent.uiColor
        //MARK: - Tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(tap)
    }
    
    
    // Performs the initial setup.
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        // Auto-layout stuff.
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        // Show the view.
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    private func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
}
