//
//  KinopoiskGetPoster.swift
//  KinopoiskAPI
//
//  Created by Илья on 04.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

open class KinopoiskGetPoster {
    
    
    /// Информация о постере
    public static var posterImageData : Data? = nil
    
    
    /// Получает постер фильма по URL постера
    ///
    /// - parameter posterURL:   URL постера
    /// - parameter posterWidth: Ширина постера (стандартное значение 360)
    public static func getPosterImage(posterURL : String, posterWidth : Int) {
        
        let URL = "https://st.kinopoisk.ru/images/\(posterURL)&width=\(posterWidth)&purge=true"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            posterImageData = data.data
        }
        
    }
    
    /// Получает постер фильма по URL постера. Ширина постера 360
    ///
    /// - parameter posterURL:   URL постера
    public static func getPosterImage(posterURL : String) {
        
        let URL = "https://st.kinopoisk.ru/images/\(posterURL)&width=360&purge=true"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            posterImageData = data.data
        }
        
    }
    
    /// Получает постер фильма по его ID
    ///
    /// - parameter filmID:      ID фильма
    /// - parameter posterWidth: Ширина постера (стандартное значение 360)
    public static func getPosterImage(filmID : Int, posterWidth : Int) {
        
        KinopoiskFilm.getFilm(filmID: filmID)
        
        let URL = "https://st.kinopoisk.ru/images/\(KinopoiskFilm.ResultingFilm?.PosterURL)&width=\(posterWidth)&purge=true"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            posterImageData = data.data
        }
        
    }
    
    /// Получает постер фильма по его ID
    ///
    /// - parameter filmID:      ID фильма
    /// - parameter posterWidth: Ширина постера (стандартное значение 360)
    public static func getPosterImage(filmID : Int) {
        
        KinopoiskFilm.getFilm(filmID: filmID)
        
        let URL = "https://st.kinopoisk.ru/images/\(KinopoiskFilm.ResultingFilm?.PosterURL)&width=360&purge=true"
        
        HTTPRequest.request(urlString: URL) { result in
            
            let data = result
            posterImageData = data.data
        }
        
    }
    
}
