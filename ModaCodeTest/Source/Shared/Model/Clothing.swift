//
//  Clothing.swift
//  ModaCodeTest
//
//  Created by Olivia Lim on 1/18/17.
//  Copyright © 2017 Olivia Lim. All rights reserved.
//

import UIKit

class Clothing: NSObject {
    
    var name = String()
    var designer = String()
    var photoURL = String()
    
    init(dictionary: [String: Any]) {
        if let data = dictionary["data"] as? [String: Any],
            let attributes = data["attributes"] as? [String: Any],
            let unwName = attributes["name"] as? String,
            let unwDesigner = attributes["designer_names"] as? String,
            
            let variantsData = attributes["variants_data"] as? NSArray,
            let firstObject = variantsData[0] as? [String:AnyObject],
            let primaryImage = firstObject["primary_image_urls"] as? [String: AnyObject],
            let mediumURL = primaryImage["medium_url"]! as? String
        {
            name = unwName
            designer = unwDesigner
            photoURL = mediumURL
            
        } else {
            fatalError("Could not create repository object from supplied dictionary")
        }
    }
    

    

}
