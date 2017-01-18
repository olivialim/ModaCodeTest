//
//  ClothingDataStore.swift
//  ModaCodeTest
//
//  Created by Olivia Lim on 1/18/17.
//  Copyright © 2017 Olivia Lim. All rights reserved.
//

import UIKit

class ClothingDataStore {
    
    static let sharedInstance = ClothingDataStore()
    
    var modaClothingArray = [Clothing]()
    
    func getClothesWithCompletion(completion: @escaping () -> ()) {
        APIManager.getClothesWithCompletion { (clothingArray) in
            
            self.modaClothingArray.removeAll()
            
            for dictionary in clothingArray {
                let clothing = Clothing(dictionary: dictionary as! [String : AnyObject])
                self.modaClothingArray.append(clothing)
            }
            if self.modaClothingArray.count > 0 {
                completion()
            }
        }
    }
    
}
