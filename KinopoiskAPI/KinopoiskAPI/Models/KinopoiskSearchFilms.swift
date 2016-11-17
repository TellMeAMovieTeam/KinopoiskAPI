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

open class KinopoiskSearchFilms {
    
    
    /// Найденные фильмы
    public static var foundFilms : [SimpleFilm] = []
    
    
    /// Количество страниц выдачи
    public static var pagesCount : Int = 0
    
    
    /// Получает список найденных фильмов по ключевому слову. Найденные фильмы помещает в FoundFilms
    ///
    /// - parameter Keyword: Ключевое слово для поиска
    public static func searchFilm(Keyword : String) {
    
        let escapedKeyword = Keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let URL = "https://api.kinopoisk.cf/searchFilms?keyword=\(escapedKeyword)"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let json = JSON(data: data.data!)
            
            //print(json)
            
            pagesCount = json["pagesCount"].intValue
            
            //print(pagesCount)
            
            for (_,object):(String, JSON) in json["searchFilms"] {
                
                //let filmID = object["id"].intValue
                //let filmNameRU = object["nameRU"].stringValue
                //print("filmID \(filmID)")
                //print("filmNameRU \(filmNameRU)")
                
                foundFilms.append(SimpleFilm(filmData: object))
                
            }
            
        }
    }
    
    
    /// Получает список найденных фильмов по ключевому слову. Найденные фильмы помещает в FoundFilms
    ///
    /// - parameter Keyword: Ключевое слово для поиска
    /// - parameter Page:    Страница выдачи
    public static func searchFilm(Keyword : String, Page : Int) {
        
        let escapedKeyword = Keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let URL = "https://api.kinopoisk.cf/searchFilms?keyword=\(escapedKeyword)&page=\(Page)"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let json = JSON(data: data.data!)
            
            //print(json)
            
            pagesCount = json["pagesCount"].intValue
            
            //print(pagesCount)
            
            for (_,object):(String, JSON) in json["searchFilms"] {
                
                //let filmID = object["id"].intValue
                //let filmNameRU = object["nameRU"].stringValue
                //print("filmID \(filmID)")
                //print("filmNameRU \(filmNameRU)")
                
                foundFilms.append(SimpleFilm(filmData: object))
                
            }
            
        }
    }
    
    
    /// Получает количество страниц фильмов с найденным ключевым словом
    ///
    /// - parameter Keyword: Ключевое слово для поиска
    public static func getSearchPages(Keyword : String) {
        
        let escapedKeyword = Keyword.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        let URL = "https://api.kinopoisk.cf/searchFilms?keyword=\(escapedKeyword)"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let json = JSON(data: data.data!)
            
            //print(json)
            
            pagesCount = json["pagesCount"].intValue
        }
    }
    
    
}

