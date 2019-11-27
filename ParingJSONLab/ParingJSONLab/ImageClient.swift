//
//  ImageClient.swift
//  ParingJSONLab
//
//  Created by Tsering Lama on 11/26/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

struct ImageCLient {
    static func getImage (urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("\(error)")
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
