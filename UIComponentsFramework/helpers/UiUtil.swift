//
//  UiUtil.swift
//  UIComponentsFramework
//
//  Created by devops on 21/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import UIKit

public class UiUtil {
    //MARK: Color
    public class func hexStringToUIColor (hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    //MARK: image sub funcs
//    public static func urlToUIImage(url:String)->UIImage{
//
//    }
    
    public static func urlToImage(url:String)->UIImage{
        return UIImage(data: NSURL(fileURLWithPath: url).dataRepresentation)!
    }
    public static func base64ToUIImage(base64:String)->UIImage{
        let data=Data(base64Encoded: base64);
        let decodedimage:UIImage = UIImage(data: data!)!;
        return decodedimage;
    }
    
    public static func imageToBase64(image:UIImage)->String{
        return image.pngData()!.base64EncodedString()
    }
    
    
    
}

