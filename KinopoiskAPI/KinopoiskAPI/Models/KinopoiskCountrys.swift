//
//  KinopoiskCountrys.swift
//  KinopoiskAPI
//
//  Created by Илья on 02.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

public class Country {

    var countryID : Int = 0
    var countryName : String = ""
    
    init(countryID : Int, countryName : String) {
        
        self.countryID = countryID
        self.countryName = countryName
    }

}

open class KinopoiskCountry {
    
    
    /// Список стран
    static var countrys : [Country] = []
    
    /// Получает страны и помещает их в Country
    public static func getCountrys(completion: @escaping ([Country]) -> ()) {
        
        let URL = "https://api.kinopoisk.cf/getCountryList"
        
        HTTPRequest.request(urlString: URL) { result in
            let data = result
            
            // преобразовали данные из строки в JSON
            let json = JSON(data: data.data!)
            
            // в цикле прходим по объектам genreData
            // вместо _ можно поставить index
            for (_,object):(String, JSON) in json["countryData"] {
                
                let countryID = object["countryID"].intValue
                let countryName = object["countryName"].stringValue
                
                /*print("CountryID \(countryID)")
                print("CountryName \(countryName)")*/
                
                countrys.append(Country(countryID : countryID, countryName : countryName))
            }
            
            completion(countrys)
            
        }
    
    }

}
