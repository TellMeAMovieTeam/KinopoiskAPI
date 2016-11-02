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
    
    var KinopoiskID : Int!
    var IMDB_ID : Int!
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
