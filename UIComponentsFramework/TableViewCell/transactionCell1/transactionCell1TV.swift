//
//  transactionCell1TV.swift
//  UIComponentsFramework
//
//  Created by devops on 11/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

public class transactionCell1TV: UITableViewCell {
    public static let identifier:String="transactionCell1";
    public static let nibname:String="transactionCell1";
    @IBOutlet public weak var myimage: UIImageView!
    @IBOutlet public weak var mytitle: UILabel!
    @IBOutlet public weak var subDesc: UILabel!
    @IBOutlet public weak var transactionDate: UILabel!
    @IBOutlet public weak var myprice: UILabel!
    
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
