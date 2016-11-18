//
//  KinopoiskGenres.swift
//  KinopoiskAPI
//
//  Created by Илья on 01.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation


/// Получает информацию о жанрах
open class KinopoiskGenres {
    
    /// Жанры
    static var genres = [Genre]()
    
    /// Получает список жанров и помещает их в genres
    public static func getGenres(completion: @escaping([Genre]) -> ()) {
        
        let getGenresURL = "https://api.kinopoisk.cf/getGenres"
        
        HTTPRequest.request(urlString: getGenresURL) { result in
            let genresData = result
            
            // преобразовали данные из строки в JSON
            let json = JSON(data: genresData.data!)
            
            // в цикле прходим по объектам genreData
            // вместо _ можно поставить index
            for (_,object):(String, JSON) in json["genreData"] {
                
                let genreId = object["genreID"].intValue
                let genreName = object["genreName"].stringValue
                
                //print("GenreID \(genreId)")
                //print("GenreName \(genreName)")
                
                genres.append(Genre(genreID : genreId, genreName : genreName))
            }
            
            completion(genres)
            
        }
    }
    
}


/// Класс, который хранит в себе информацию о жанре (ID и его имя)
public class Genre {
    
    var genreID : Int
    var genreName : String
    
    
    /// Конструктор класса Genre
    ///
    /// - parameter GenreID:   ID жанра
    /// - parameter GenreName: Описание жанра
    ///
    /// - returns: Экземпляр объекта Genre
    init(genreID : Int, genreName : String) {
        
        self.genreID = genreID
        self.genreName = genreName
    }
    
    
}
