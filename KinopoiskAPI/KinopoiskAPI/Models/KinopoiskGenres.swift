//
//  KinopoiskGenres.swift
//  KinopoiskAPI
//
//  Created by Илья on 01.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

open class KinopoiskGenres{
    
    static var genres : String = ""
    
    public static func getGenres() {
        
        let getGenresURL = "https://api.kinopoisk.cf/getGenres"
        
        HTTPRequest.request(urlString: getGenresURL) { result in
            genres = result
            
            if let dataFromString = genres.data(using: .utf8, allowLossyConversion: false) {
                
                let json = JSON(data: dataFromString)
                let arrayNames =  json["genreData"].arrayValue.map({$0["genreName"].stringValue})
                print(arrayNames)
            }
        }
    }
    
}
