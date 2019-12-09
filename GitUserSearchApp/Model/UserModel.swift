//
//  UserModel.swift
//  GitUserSearchApp
//
//  Created by Christopher Pung on 12/9/19.
//  Copyright © 2019 Mobile Apps Company. All rights reserved.
//

import Foundation
import UIKit

typealias ImageHandler = (UIImage?) -> Void

struct User{
    
    let image: String
    let username: String
    let email: String
    let location: String
    let joined: Date
    let followers: Int
    let following: Int
    let biography: String

    func getImage(completion: @escaping ImageHandler) {
         
         guard let url = URL(string: image) else {
             completion(nil)
             return
         }
         
         URLSession.shared.dataTask(with: url ) { (dat, _, _) in
             if let data = dat {
                 DispatchQueue.main.async {
                     completion(UIImage(data: data))
                 }
             }
         }.resume()
     }
}
