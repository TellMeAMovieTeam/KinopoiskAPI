//
//  KinopoiskSearchFilms.swift
//  KinopoiskAPI
//
//  Created by Илья on 04.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

/// Простой класс для хранения инфы о фильме. Основное отличие от
/// класса Film - меньше информации
public class SimpleFilm {
    
    var kinopoiskID : Int!
    var kpType : String = ""
    var nameRU : String = ""
    var nameEN : String = ""
    var posterURL : String = ""
    var year : Int = 0
    var filmLength : String = ""
    var country : String = ""
    var genre : String = ""
    var description : String = ""
    var rating : String = ""
    
    init(filmData : JSON) {
        
        self.kinopoiskID = filmData["id"].intValue
        self.kpType = filmData["type"].stringValue
        self.nameRU = filmData["nameRU"].stringValue
        self.nameEN = filmData["nameEN"].stringValue
        self.description = filmData["description"].stringValue
        self.posterURL = filmData["posterURL"].stringValue
        self.filmLength = filmData["filmLength"].stringValue
        self.year = filmData["year"].intValue
        self.country = filmData["country"].stringValue
        self.genre = filmData["genre"].stringValue
        self.rating = filmData["rating"].stringValue
    }
    
}


/// Структура с результатами о поиске
public struct KPFoundFilms{
    
    public var foundFilms : [SimpleFilm]
    public var pagesCount : Int
    
    public init(foundFilms : [SimpleFilm], pagesCount : Int) {
        
        self.foundFilms = foundFilms
        self.pagesCount = pagesCount
    }
    
}

open class KinopoiskSearchFilms {
    
    /// Найденные фильмы
    static var foundFilms : [SimpleFilm] = []
    
    
    /// Количество страниц выдачи
    static var pagesCount : Int = 0
    
    /// Получает список найденных фильмов по ключевому слову. Найденные фильмы помещает в FoundFilms
    ///
    /// - parameter Keyword: Ключевое слово для поиска
    /// - parameter completion: Возвращает структуру KPFoundFilms с данными результата
    public static func searchFilm(Keyword : String, completion: @escaping (KPFoundFilms) -> ()) {
        
        let escapedKeyword = Keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let URL = "https://api.kinopoisk.cf/searchFilms?keyword=\(escapedKeyword)"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let json = JSON(data: data.data!)
            
            //print(json)
            
            pagesCount = json["pagesCount"].intValue
            
            //print(pagesCount)
            
            for (_,object):(String, JSON) in json["searchFilms"] {
                
                foundFilms.append(SimpleFilm(filmData: object))
                
            }
            
            let kpFoundFilms : KPFoundFilms = KPFoundFilms(foundFilms: foundFilms, pagesCount: pagesCount)
            
            completion(kpFoundFilms)
            
        }
    }
    
    /// Получает список найденных фильмов по ключевому слову. Найденные фильмы помещает в FoundFilms
    ///
    /// - parameter Keyword: Ключевое слово для поиска
    /// - parameter Page:    Страница выдачи
    /// - parameter completion: Возвращает структуру KPFoundFilms с данными результата
    public static func searchFilm(Keyword : String, Page : Int, completion: @escaping (KPFoundFilms) -> ()) {
        
        let escapedKeyword = Keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let URL = "https://api.kinopoisk.cf/searchFilms?keyword=\(escapedKeyword)&page=\(Page)"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let json = JSON(data: data.data!)
            
            pagesCount = json["pagesCount"].intValue
            
            for (_,object):(String, JSON) in json["searchFilms"] {
                
                foundFilms.append(SimpleFilm(filmData: object))
                
            }
            
            let kpFoundFilms : KPFoundFilms = KPFoundFilms(foundFilms: foundFilms, pagesCount: pagesCount)
            
            completion(kpFoundFilms)
        }
    }
    
    /// Получает количество страниц фильмов с найденным ключевым словом
    ///
    /// - parameter Keyword: Ключевое слово для поиска
    /// - parameter completion: Количество страниц выдачи
    public static func getSearchPages(Keyword : String, completion: @escaping (Int) -> ()) {
        
        let escapedKeyword = Keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let URL = "https://api.kinopoisk.cf/searchFilms?keyword=\(escapedKeyword)"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let json = JSON(data: data.data!)
            
            pagesCount = json["pagesCount"].intValue
            
            completion(pagesCount)
        }
    }
    
    
}

