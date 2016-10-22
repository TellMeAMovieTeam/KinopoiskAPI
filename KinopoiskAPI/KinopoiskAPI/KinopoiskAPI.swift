//
//  KinopoiskAPI.swift
//  KinopoiskAPI
//
//  Created by Илья on 21.10.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

class KinopoiskAPI {
    
    
    
    /// Получает полное описание фильма
    ///
    /// - parameter filmID:     ID фильма
    /// - parameter completion: асинхронная работа с сетью
    static func getFilm(filmID: Int, completion: @escaping (String) -> ()) {
        let url = URL(string: "https://api.kinopoisk.cf/getFilm?filmID=\(filmID)")!
        
        URLSession.shared.dataTask(with:url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion("")
            } else {
                if let returnData = String(data: data!, encoding: .utf8) {
                    completion(returnData)
                } else {
                    completion("")
                }
            }
            }.resume()
    }
}
