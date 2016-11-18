//
//  KinopoiskGetPoster.swift
//  KinopoiskAPI
//
//  Created by Илья on 04.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

open class KinopoiskGetPoster {
    
    /// Получает постер фильма по URL постера
    ///
    /// - parameter posterURL:   URL постера
    /// - parameter posterWidth: Ширина постера (стандартное значение 360)
    public static func getPosterImage(posterURL : String, posterWidth : Int, completion: @escaping (Data) -> ()) {
        
        let URL = "https://st.kinopoisk.ru/images/\(posterURL)&width=\(posterWidth)&purge=true"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let posterImageData : Data = data.data!
            
            completion(posterImageData)
        }
        
    }
    
    /// Получает постер фильма по URL постера. Ширина постера 360
    ///
    /// - parameter posterURL:   URL постера
    public static func getPosterImage(posterURL : String, completion: @escaping (Data) -> ()) {
        
        let URL = "https://st.kinopoisk.ru/images/\(posterURL)&width=360&purge=true"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            let posterImageData : Data = data.data!
            
            completion(posterImageData)
        }
        
    }
    
    /// Получает постер фильма по его ID
    ///
    /// - parameter filmID:      ID фильма
    /// - parameter posterWidth: Ширина постера (стандартное значение 360)
    public static func getPosterImage(filmID : Int, posterWidth : Int, completion: @escaping (Data) -> ()) {
        
        KinopoiskFilm.getFilm(filmID: filmID) { resultingFilm in
            
            let URL = "https://st.kinopoisk.ru/images/\(resultingFilm.posterURL)&width=\(posterWidth)&purge=true"
            
            HTTPRequest.request(urlString: URL) { result in
                
                let data = result
                let posterImageData : Data = data.data!
                
                completion(posterImageData)
                
            }
        }
        
    }
    
    /// Получает постер фильма по его ID
    ///
    /// - parameter filmID:      ID фильма
    /// - parameter posterWidth: Ширина постера (стандартное значение 360)
    public static func getPosterImage(filmID : Int, completion: @escaping (Data) -> ()) {
        
        KinopoiskFilm.getFilm(filmID: filmID) { resultingFilm in
            
            
            let URL = "https://st.kinopoisk.ru/images/\(resultingFilm.posterURL)&width=360&purge=true"
            
            HTTPRequest.request(urlString: URL) { result in
                
                let data = result
                let posterImageData : Data = data.data!
                
                completion(posterImageData)
            }
        }
    }
    
}
