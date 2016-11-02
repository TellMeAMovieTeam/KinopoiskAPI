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
