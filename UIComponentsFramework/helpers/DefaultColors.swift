//
//  DefaultColors.swift
//  UIComponentsFramework
//
//  Created by devops on 23/05/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation

enum AppColor {
    
    case primary
    case primaryDark
    case primaryLight
    case accent
    case danger
    case white
    case black
    case gray
    case purple
    case miniBG
    case et_frame_bg
    case green
    case red
    
    // MARK: TextField BG Colors
    case textFieldPrimaryBG
    case textFieldSecondaryBG
    case textFieldDisabledBG
    case textFieldGrayBG
    
    // MARK: TextField Font Colors
    case textFieldPrimaryFont
    case textFieldSecondaryFont
    case textFieldDisabledFont
    
    // MARK: Button BG Colors
    case buttonPrimaryBG
    case buttonPrimaryDarkBG
    case buttonPrimaryLightBG
    case buttonSecondaryBG
    case buttonDisabledBG
    case buttonDangerBG
    
    // MARK: Button Font Colors
    case buttonPrimaryFontColor
    case buttonAccentFontColor
    case buttonSecondaryFontColor
    case buttonDisabledFontColor
    case buttonDangerFontColor
    
    var str: String {
        switch self {
        case .primary: return "7E57C2"
        case .primaryDark: return "512DA8"
        case .primaryLight: return "FFA726"
        case .accent: return "B41E8C"
        case .white: return "FFFFFF"
        case .green: return "7CB342"
        case .red: return "FF3232"
        default:
            return "000000"
        }
    }
    
    var hex: UInt32 {
        switch self {
        case .primary:      return 0xFF7E57C2
        case .primaryDark:  return 0xFF512DA8
        case .primaryLight: return 0xFFFFA726
        case .accent:       return 0xFFB41E8C
        case .danger:       return 0xFFE57373
        case .white:        return 0xFFFFFFFF
        case .black:        return 0xFF000000
        case .gray:         return 0xFFCCCCCC
        case .purple:       return 0xFFB42E82
        case .miniBG:       return 0xFF753F9A
        case .et_frame_bg:  return 0xFFB499C7
            
        // MARK: TextField BG Colors
        case .textFieldPrimaryBG:     return 0x80FFFFFF
        case .textFieldSecondaryBG:   return 0x54000000
        case .textFieldDisabledBG:    return 0x4DFFFFFF
        case .textFieldGrayBG:        return 0x80CCCCCC
            
        // MARK: TextField Font Colors
        case .textFieldPrimaryFont:     return 0xFFFFFFFF
        case .textFieldSecondaryFont:   return 0xFFFFFFFF
        case .textFieldDisabledFont:    return 0xFFFFFFFF
            
            // MARK: Button BG Colors
        //case .buttonPrimaryBG:      return 0xFFFFFFFF
        case .buttonPrimaryBG:      return 0xFF7E57C2
        case .buttonPrimaryDarkBG:  return 0xFF512DA8
        case .buttonPrimaryLightBG: return 0xFFFFA726
        case .buttonSecondaryBG:    return 0xFFB42E82
        case .buttonDisabledBG:     return 0xFFCCCCCC
        case .buttonDangerBG:       return 0xFFE57373
            
        // MARK: Button Font Colors
        case .buttonPrimaryFontColor:       return 0xFFB42E82
        case .buttonAccentFontColor:        return 0xFFB41E8C
        case .buttonSecondaryFontColor:     return 0xFFFFFFFF
        case .buttonDisabledFontColor:      return 0xCC000000
        case .buttonDangerFontColor:        return 0xFFFFFFFF
        case .green:
            return 0x7CB342
        case .red:
            return 0xFF3232
        }
    }
    
    var uiColor: UIColor {
        return UiUtil.hexStringToUIColor(hex: self.str)
        //        return UIColor(hex: Int(self.hex))
        
    }
}
