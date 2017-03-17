//
//  UIColorExtension.swift
//  Stretchy-Snacks
//
//  Created by Dave Augerinos on 2017-03-16.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        
        var str = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if(str.hasPrefix("#")) {
            str.remove(at: str.startIndex)
        }
        
        if(str.characters.count != 8) {
         
            self.init()
        }
        
        else {
            var rgbValue:UInt32 = 0
            Scanner(string: str).scanHexInt32(&rgbValue)
            
            self.init(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            )
        }
    }
}
