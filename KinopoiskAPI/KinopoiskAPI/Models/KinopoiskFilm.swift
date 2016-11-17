//
//  KinopoiskFilm.swift
//  KinopoiskAPI
//
//  Created by Илья on 02.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

open class KinopoiskFilm {
    
    static var resultingFilm : Film? = nil
    
    /// Получает фильм по указаному ID и помещает информацию о фильме в ResultingFilm
    ///
    /// - parameter filmID: ID фильма
    public static func getFilm(filmID: Int) {
        
        let getFilmURL = "https://api.kinopoisk.cf/getFilm?filmID=\(filmID)"
        
        HTTPRequest.request(urlString: getFilmURL) { result in
           
            let filmData = result
            let json = JSON(data: filmData.data!)

            resultingFilm = Film(filmData: json)
        }
    }
    
}


/// Все данные о фильме
public class Film {
    
    var kinopoiskID : Int!
    var imdb_ID : String!
    var webURL : String = ""
    var nameRU : String = ""
    var nameEN : String = ""
    var posterURL : String = ""
    var year : Int = 0
    var filmLength : String = ""
    var country : String = ""
    var genre : String = ""
    var slogan : String = ""
    var description : String = ""
    var ratingMPAA : String = ""
    var ageLimits : Int = 0
    var ratingData : [FilmRating] = []
    var staff : [AnyObject] = []
    
    private var category : [KPPerson] = []
    
    init(filmData : JSON) {
        
        // Gloss
        
        //TODO возможно добавить хранилку кадров
        
        self.kinopoiskID = filmData["filmID"].intValue
        self.imdb_ID = filmData["imdbID"].stringValue
        self.webURL = filmData["webURL"].stringValue
        self.nameRU = filmData["nameRU"].stringValue
        self.nameEN = filmData["nameEN"].stringValue
        self.posterURL = filmData["posterURL"].stringValue
        self.year = filmData["year"].intValue
        self.filmLength = filmData["filmLength"].stringValue
        self.country = filmData["country"].stringValue
        self.genre = filmData["genre"].stringValue
        self.slogan = filmData["slogan"].stringValue
        self.description = filmData["description"].stringValue
        self.ratingMPAA = filmData["ratingMPAA"].stringValue
        self.ageLimits = filmData["ratingAgeLimits"].intValue
        
        let MovieRatings = filmData["ratingData"]
        
        self.ratingData.append(FilmRating(ratingName: "ratingKP", ratingValue: MovieRatings["rating"].floatValue as AnyObject))
        self.ratingData.append(FilmRating(ratingName: "ratingKPVoteCount", ratingValue: MovieRatings["ratingVoteCount"].intValue as AnyObject))
        self.ratingData.append(FilmRating(ratingName: "ratingIMDb", ratingValue: MovieRatings["ratingIMDb"].floatValue as AnyObject))
        self.ratingData.append(FilmRating(ratingName: "ratingIMDbVoteCount", ratingValue: MovieRatings["ratingIMDbVoteCount"].intValue as AnyObject))
        
        // очень ужатая информация
        //зашли в "создатели"
        for (_,categoryJSON):(String, JSON) in filmData["creators"] {
            //зашли в категорию
            for (_,object):(String, JSON) in categoryJSON {
                
                category.append(KPPerson(personData: object))
                //print(object["nameEN"].stringValue)
            }
            
            self.staff.append(category as AnyObject)
        }
    }
}

/// Описание рейтинга фильма
public class FilmRating{
    
    var ratingName : String
    var ratingValue : AnyObject
    
    init(ratingName : String, ratingValue : AnyObject) {
        
        self.ratingName = ratingName
        self.ratingValue = ratingValue
        
    }
}
