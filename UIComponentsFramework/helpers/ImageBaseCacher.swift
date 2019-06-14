//
//  ImageBase64Cacher.swift
//  UIComponentsFramework
//
//  Created by devops on 14/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


public class ImageBaseCacher{
    public func cacheImage(url:String, image:UIImage){
        let defaults = UserDefaults.standard;
        defaults.set(UiUtil.imageToBase64(image: image), forKey: url)
    }
    public func retrieveImage(url:String)-> UIImage{
        let defaults = UserDefaults.standard;
        return  UiUtil.base64ToUIImage(base64:defaults.value(forKey: url) as! String);
    }
    
}
