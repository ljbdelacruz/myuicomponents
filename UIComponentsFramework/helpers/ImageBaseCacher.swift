//
//  ImageBase64Cacher.swift
//  UIComponentsFramework
//
//  Created by devops on 14/06/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


public class ImageBaseCacher{
    //sends the id and the image you want to transform into base64 to be stored locally
    public func cacheImage(id:String, image:UIImage){
        let defaults = UserDefaults.standard;
        defaults.set(UiUtil.imageToBase64(image: image), forKey: id)
    }
    //retrieve the image locally from base64 to UIImage to be displayed into your app
    public func retrieveImage(id:String)-> UIImage{
        let defaults = UserDefaults.standard;
        return  UiUtil.base64ToUIImage(base64:defaults.value(forKey: id) as! String);
    }
    
}
