//
//  APIManager.swift
//  ModaCodeTest
//
//  Created by Olivia Lim on 1/18/17.
//  Copyright © 2017 Olivia Lim. All rights reserved.
//

import UIKit

class APIManager {
    
    // Base API URLs
    static let baseURL: String = "https://api.modaoperandi.com/public/v3.1/pages/shop/clothing"
    static let allBooks: String = baseURL + "/books"
    static let addBook: String = baseURL + "/books/"
    static let deleteAllBooks: String =  baseURL + "/clean"
    
    //MARK: GET All Books
    class func getClothesWithCompletion(completion: @escaping (NSArray) -> ()) {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)

        
        if let apiURL = NSURL(string: baseURL) {
            let dataTask = session.dataTask(with: apiURL as URL, completionHandler: { (data, response, error) in
                if let data = data {
                    do {
                        let responseData = try JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                        completion(responseData)
                    } catch {
                        print("error")
                    }
                }
            })
            dataTask.resume()
        }
    }
}
