//
//  cardCell1.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class cardCell1: UITableViewCell {
    public static let identifier:String="cardCell1";
    public static let nibname:String="cardCell1";
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var cardName: UILabel!
    @IBOutlet public weak var cardNumber: UILabel!
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
