//
//  UIColor-Extension.swift
//  ChatAppWithFirebase
//
//  Created by 河野隆 on 2020/09/15.
//  Copyright © 2020 河野隆. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        
        return self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    
    
}
