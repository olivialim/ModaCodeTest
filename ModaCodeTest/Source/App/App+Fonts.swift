//
//  App+Fonts.swift
//  ModaCodeTest
//
//  Created by Olivia Lim on 1/18/17.
//  Copyright © 2017 Olivia Lim. All rights reserved.
//

import UIKit

extension App {
    struct Font {
        enum Size  : CGFloat {
            case XXLarge = 36.0
            case XLarge = 30.0
            case Large = 21.0
            case Medium = 19.0
            case Small = 17.0
            case XSmall = 15.0
        }
        
        static  func ralewayBold(size: Size) -> UIFont {
            return UIFont(name: "Raleway-Bold", size: size.rawValue)!
        }
        
        static func ralewayRegular(size: Size) -> UIFont {
            return UIFont(name: "Raleway-Regular", size: size.rawValue)!
        }
        
        static func ralewayMedium(size: Size) -> UIFont {
            return UIFont(name: "Raleway-Medium", size: size.rawValue)!
        }
        
    }
}


//MARK: - Utilities
extension App.Font {
    
//    static func listSystemFonts()  {
//        for family: AnyObject in UIFont.familyNames {
//            print("Font Family: \(family)")
//            for font: AnyObject in UIFont.fontNamesForFamilyName(family as! String) {
//                print("Font Name: \(font)")
//            }
//        }
//    }
    
}
