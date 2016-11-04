//
//  KinopoiskStaff.swift
//  KinopoiskAPI
//
//  Created by Илья on 04.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

open class KinopoiskStaff {

    public static var Staff : [AnyObject] = []
    private static var Category : [KPPerson] = []
    
    public static func getStaff(filmID : Int) {
        
        let URL = "https://api.kinopoisk.cf/getStaff?filmID=\(filmID)"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let json = JSON(data: data.data!)
            
            //print(json)
            //зашли в "создатели"
            for (_,category):(String, JSON) in json["creators"] {
                //зашли в категорию
                for (_,object):(String, JSON) in category {
                    
                    Category.append(KPPerson(PersonData: object))
                    //print(object["nameEN"].stringValue)
                }
                
                Staff.append(Category as AnyObject)
            }
            
        }
    
    }
    
}


/// Хранение информации о персоне
public class KPPerson {

    var id : Int = 0
    var KPType : String = ""
    var NameRU : String = ""
    var NameEN : String = ""
    var PosterURL : String = ""
    var ProfessionText : String = ""
    var ProfessionKey : String = ""
    var Description : String = ""

    init(PersonData : JSON) {
        
        self.id = PersonData["id"].intValue
        self.KPType = PersonData["type"].stringValue
        self.NameRU = PersonData["nameRU"].stringValue
        self.NameEN = PersonData["nameEN"].stringValue
        self.PosterURL = PersonData["posterURL"].stringValue
        self.ProfessionText = PersonData["professionText"].stringValue
        self.ProfessionKey = PersonData["professionKey"].stringValue
        self.Description = PersonData["description"].stringValue
        
    }
}
