//
//  KinopoiskFilm.swift
//  KinopoiskAPI
//
//  Created by Илья on 02.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

open class KinopoiskFilm {


}


public class Film {
    
    var KinopoiskID : String!
    var IMDB_ID : String!
    var WebURL : String = ""
    var NameRU : String = ""
    var NameEN : String = ""
    var PosterURL : String = ""
    var Year : Int = 0
    var FilmLength : String = ""
    var Country : String = ""
    var Genre : String = ""
    var Slogan : String = ""
    var Description : String = ""
    var RatingMPAA : String = ""
    var AgeLimits : Int = 0
    var RatingData : [FilmRating] = []
    
    init(FilmData : JSON) {
        
        self.KinopoiskID = FilmData["filmID"].stringValue
        self.IMDB_ID = FilmData["imdbID"].stringValue
        self.WebURL = FilmData["webURL"].stringValue
        self.NameRU = FilmData["nameRU"].stringValue
        self.NameEN = FilmData["nameEN"].stringValue
        self.PosterURL = FilmData["posterURL"].stringValue
        self.Year = FilmData["year"].intValue
        self.FilmLength = FilmData["filmLength"].stringValue
        self.Country = FilmData["country"].stringValue
        self.Genre = FilmData["genre"].stringValue
        self.Slogan = FilmData["slogan"].stringValue
        self.Description = FilmData["description"].stringValue
        self.RatingMPAA = FilmData["ratingMPAA"].stringValue
        self.AgeLimits = FilmData["ratingAgeLimits"].intValue
        
        let MovieRatings = FilmData["ratingData"]
        
        self.RatingData.append(FilmRating(RatingName: "ratingKP", RatingValue: MovieRatings["rating"].floatValue as AnyObject))
        self.RatingData.append(FilmRating(RatingName: "ratingKPVoteCount", RatingValue: MovieRatings["ratingVoteCount"].intValue as AnyObject))
        self.RatingData.append(FilmRating(RatingName: "ratingIMDb", RatingValue: MovieRatings["ratingIMDb"].floatValue as AnyObject))
        self.RatingData.append(FilmRating(RatingName: "ratingIMDbVoteCount", RatingValue: MovieRatings["ratingIMDbVoteCount"].intValue as AnyObject))
    }
}


/// Описание рейтинга фильма
public class FilmRating{

    var RatingName : String
    var RatingValue : AnyObject
    
    init(RatingName : String, RatingValue : AnyObject) {
    
        self.RatingName = RatingName
        self.RatingValue = RatingValue
    
    }
}
