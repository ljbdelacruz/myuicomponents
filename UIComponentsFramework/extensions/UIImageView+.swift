//
//  UIImage+.swift
//  UIComponentsFramework
//
//  Created by devops on 10/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


extension UIImageView{
    //setting the corners of the image rounded
    public func setRounded(borderColor:UIColor){
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.cgColor;
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    public func setRounded(){
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
    
    
    public func decodeBase64ToImage(){
//        let dataDecoded:NSData = NSData(base64EncodedString: strBase64, options: NSDataBase64DecodingOptions(rawValue: 0))!
//        let decodedimage:UIImage = UIImage(data: dataDecoded)!
//        yourImageView.image = decodedimage
    }
}
