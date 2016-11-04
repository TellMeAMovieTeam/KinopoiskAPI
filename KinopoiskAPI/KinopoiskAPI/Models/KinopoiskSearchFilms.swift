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
    
    var KinopoiskID : Int!
    var KPType : String = ""
    var NameRU : String = ""
    var NameEN : String = ""
    var PosterURL : String = ""
    var Year : Int = 0
    var FilmLength : String = ""
    var Country : String = ""
    var Genre : String = ""
    var Description : String = ""
    var Rating : String = ""
    
    init(FilmData : JSON) {
    
        self.KinopoiskID = FilmData["id"].intValue
        self.KPType = FilmData["type"].stringValue
        self.NameRU = FilmData["nameRU"].stringValue
        self.NameEN = FilmData["nameEN"].stringValue
        self.Description = FilmData["description"].stringValue
        self.PosterURL = FilmData["posterURL"].stringValue
        self.FilmLength = FilmData["filmLength"].stringValue
        self.Year = FilmData["year"].intValue
        self.Country = FilmData["country"].stringValue
        self.Genre = FilmData["genre"].stringValue
        self.Rating = FilmData["rating"].stringValue
    }

}

open class KinopoiskSearchFilms {
    
    
    /// Найденные фильмы
    public static var FoundFilms : [SimpleFilm] = []
    
    
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
                
                FoundFilms.append(SimpleFilm(FilmData: object))
                
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
                
                FoundFilms.append(SimpleFilm(FilmData: object))
                
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

