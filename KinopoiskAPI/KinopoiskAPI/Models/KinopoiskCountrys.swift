//
//  KinopoiskCountrys.swift
//  KinopoiskAPI
//
//  Created by Илья on 02.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

public class Country {

    var CountryID : Int = 0
    var CountryName : String = ""
    
    init(CountryID : Int, CountryName : String) {
        
        self.CountryID = CountryID
        self.CountryName = CountryName
    }

}

open class KinopoiskCountry {
    
    static var Countrys : [Country] = []
    
    public static func getCountrys() {
        
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
                
                print("CountryID \(countryID)")
                print("CountryName \(countryName)")
                
                Countrys.append(Country(CountryID : countryID, CountryName : countryName))
            }
            
        }
    
    }

}
