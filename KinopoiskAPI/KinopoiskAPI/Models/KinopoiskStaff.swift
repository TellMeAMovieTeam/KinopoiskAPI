//
//  KinopoiskStaff.swift
//  KinopoiskAPI
//
//  Created by Илья on 04.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

open class KinopoiskStaff {

    static var staff : [AnyObject] = []
    private static var category : [KPPerson] = []
    
    
    /// Получает данные о создателях фильма
    ///
    /// - parameter filmID:     ID фильма
    /// - parameter completion: Возвращает список создателей разбитый по категориям в виде массива AnyObject
    public static func getStaff(filmID : Int, completion: @escaping([AnyObject]) -> ()) {
        
        let URL = "https://api.kinopoisk.cf/getStaff?filmID=\(filmID)"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let json = JSON(data: data.data!)
            
            //зашли в "создатели"
            for (_,categoryJSON):(String, JSON) in json["creators"] {
                //зашли в категорию
                for (_,object):(String, JSON) in categoryJSON {
                    
                    category.append(KPPerson(personData: object))
                }
                
                staff.append(category as AnyObject)
            }
            
            completion(staff)
            
        }
    
    }
    
}


/// Хранение информации о персоне
public class KPPerson {

    var id : Int = 0
    var kpType : String = ""
    var nameRU : String = ""
    var nameEN : String = ""
    var posterURL : String = ""
    var professionText : String = ""
    var professionKey : String = ""
    var description : String = ""

    init(personData : JSON) {
        
        self.id = personData["id"].intValue
        self.kpType = personData["type"].stringValue
        self.nameRU = personData["nameRU"].stringValue
        self.nameEN = personData["nameEN"].stringValue
        self.posterURL = personData["posterURL"].stringValue
        self.professionText = personData["professionText"].stringValue
        self.professionKey = personData["professionKey"].stringValue
        self.description = personData["description"].stringValue
        
    }
}
