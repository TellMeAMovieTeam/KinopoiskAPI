//
//  KinopoiskGallery.swift
//  KinopoiskAPI
//
//  Created by Илья on 02.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation


/// Данные об одном кадре фильма
public class GalleryImage {

    var ImageURL : String = ""
    var ImagePreviewURL : String = ""
    var SocialURL : String = ""
    
    init(ImageURL : String, ImagePreviewURL :  String, SocialURL : String) {
        
        self.ImageURL = ImageURL
        self.ImagePreviewURL = ImagePreviewURL
        self.SocialURL = SocialURL
    }
}


open class KinopoiskGallery {
    
    
    /// Простая галлерея
    public static var Gallery : [GalleryImage] = []
    
    /// <#Description#>
    public static var Gallery_SP : [GalleryImage] = []
    
    /// Галлерея постеров
    public static var Posters : [GalleryImage] = []
    
    
    /// Получает галлереи для фильма по его ID
    ///
    /// - parameter filmID: ID фильма
    public static func getGallery(filmID : Int) {
        
        let getGalleryURL = "https://api.kinopoisk.cf/getGallery?filmID=\(filmID)"
        
        HTTPRequest.request(urlString: getGalleryURL) { result in
            
            let galleryData = result
            let json = JSON(data: galleryData.data!)
            
            let gallery = json["gallery"]
            //print (gallery)
            
            //получаем кадры
            for (_,object):(String, JSON) in gallery["kadr"] {
                
                let _imageURL = object["image"].stringValue
                let _previewURL = object["preview"].stringValue
                let _socialURL = object["socialURL"].stringValue
                
                //print("ImageURL: \(_imageURL)")
                //print("PreviewURL: \(_previewURL)")
                //print("SocialURL: \(_socialURL)")
                
                Gallery.append(GalleryImage(ImageURL: _imageURL, ImagePreviewURL: _previewURL, SocialURL: _socialURL))
            }
            
            //получаем кадры_SP
            for (_,object):(String, JSON) in gallery["kadr_sp"] {
                
                let _imageURL = object["image"].stringValue
                let _previewURL = object["preview"].stringValue
                let _socialURL = object["socialURL"].stringValue
                
                //print("ImageURL: \(_imageURL)")
                //print("PreviewURL: \(_previewURL)")
                //print("SocialURL: \(_socialURL)")
                
                Gallery_SP.append(GalleryImage(ImageURL: _imageURL, ImagePreviewURL: _previewURL, SocialURL: _socialURL))
            }
            
            //получаем постеры
            for (_,object):(String, JSON) in gallery["poster"] {
                
                let _imageURL = object["image"].stringValue
                let _previewURL = object["preview"].stringValue
                let _socialURL = object["socialURL"].stringValue
                
                //print("ImageURL: \(_imageURL)")
                //print("PreviewURL: \(_previewURL)")
                //print("SocialURL: \(_socialURL)")
                
                Posters.append(GalleryImage(ImageURL: _imageURL, ImagePreviewURL: _previewURL, SocialURL: _socialURL))
            }
            
        }
    
    }

}
