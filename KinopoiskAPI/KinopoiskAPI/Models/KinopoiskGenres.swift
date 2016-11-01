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
            
        }
    }

}
