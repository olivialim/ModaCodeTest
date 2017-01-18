//
//  App+Color.swift
//  ModaCodeTest
//
//  Created by Olivia Lim on 1/18/17.
//  Copyright © 2017 Olivia Lim. All rights reserved.
//

import UIKit

extension App {
    struct Color {
        
        //MARK: Black and white
        static func white() -> UIColor {
            return self.fromHex(hex: 0xFFFFFF, alpha: 1.0)
        }
        static func black() -> UIColor {
            return self.fromHex(hex: 0x000000, alpha: 1.0)
        }
        
        //MARK: Gray scale
        static func lightGray() -> UIColor {
            return self.fromHex(hex: 0xf8f8f8, alpha: 1.0)
        }
        static func gray() -> UIColor {
            return self.fromHex(hex: 0xcccccc, alpha: 1.0)
        }
        
        //MARK: Colors
        static func lightPink() -> UIColor {
            return self.fromHex(hex: 0xf4e6e6, alpha: 1.0)
        }
        static func burgundy() -> UIColor {
            return self.fromHex(hex: 0x3c1315, alpha: 1.0)
        }
        static func gold() -> UIColor {
            return self.fromHex(hex: 0xf2d78d, alpha: 1.0)
        }
    }
}

//MARK: - Utilities
extension App.Color {
    
    static func fromHex(hex: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        let redComponent = (hex & 0xFF0000) >> 16
        let greenComponent = (hex & 0x00FF00) >> 8
        let blueComponent = hex & 0x0000FF
        
        let r = CGFloat(redComponent)/255.0
        let g = CGFloat(greenComponent)/255.0
        let b = CGFloat(blueComponent)/255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}
