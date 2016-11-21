//
//  KinopoiskGallery.swift
//  KinopoiskAPI
//
//  Created by Илья on 02.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation


/// Хранит в себе основные галлереи фильма
public struct KinopoiskGallerys {
    
    public var gallery : [GalleryImage]
    public var gallery_SP : [GalleryImage]
    public var posters : [GalleryImage]
    
    public init(gallery: [GalleryImage], gallery_SP: [GalleryImage], posters: [GalleryImage]) {
    
        self.gallery = gallery
        self.gallery_SP = gallery_SP
        self.posters = posters
    
    }
}

/// Данные об одном кадре фильма
public class GalleryImage {

    var imageURL : String = ""
    var imagePreviewURL : String = ""
    var socialURL : String = ""
    
    init(imageURL : String, imagePreviewURL :  String, socialURL : String) {
        
        self.imageURL = imageURL
        self.imagePreviewURL = imagePreviewURL
        self.socialURL = socialURL
    }
}


open class KinopoiskGallery {
    
    
    /// Простая галлерея
    public static var gallery : [GalleryImage] = []
    
    /// Дополнительная галлерея
    public static var gallery_SP : [GalleryImage] = []
    
    /// Галлерея постеров
    public static var posters : [GalleryImage] = []
    
    /// Получает галлереи для фильма по его ID
    ///
    /// - parameter filmID: ID фильма
    /// - parameter completion: Возвращает объект структуры KinopoiskGallerys
    public static func getGallery(filmID : Int, completion: @escaping (KinopoiskGallerys) -> ()) {
        
        let getGalleryURL = "https://api.kinopoisk.cf/getGallery?filmID=\(filmID)"
        
        HTTPRequest.request(urlString: getGalleryURL) { result in
            
            let galleryData = result
            let json = JSON(data: galleryData.data!)
            
            let galleryJSON = json["gallery"]
            //print (gallery)
            
            //получаем кадры
            for (_,object):(String, JSON) in galleryJSON["kadr"] {
                
                let _imageURL = object["image"].stringValue
                let _previewURL = object["preview"].stringValue
                let _socialURL = object["socialURL"].stringValue
                
                //print("ImageURL: \(_imageURL)")
                //print("PreviewURL: \(_previewURL)")
                //print("SocialURL: \(_socialURL)")
                
                gallery.append(GalleryImage(imageURL: _imageURL, imagePreviewURL: _previewURL, socialURL: _socialURL))
            }
            
            //получаем кадры_SP
            for (_,object):(String, JSON) in galleryJSON["kadr_sp"] {
                
                let _imageURL = object["image"].stringValue
                let _previewURL = object["preview"].stringValue
                let _socialURL = object["socialURL"].stringValue
                
                //print("ImageURL: \(_imageURL)")
                //print("PreviewURL: \(_previewURL)")
                //print("SocialURL: \(_socialURL)")
                
                gallery_SP.append(GalleryImage(imageURL: _imageURL, imagePreviewURL: _previewURL, socialURL: _socialURL))
            }
            
            //получаем постеры
            for (_,object):(String, JSON) in galleryJSON["poster"] {
                
                let _imageURL = object["image"].stringValue
                let _previewURL = object["preview"].stringValue
                let _socialURL = object["socialURL"].stringValue
                
                //print("ImageURL: \(_imageURL)")
                //print("PreviewURL: \(_previewURL)")
                //print("SocialURL: \(_socialURL)")
                
                posters.append(GalleryImage(imageURL: _imageURL, imagePreviewURL: _previewURL, socialURL: _socialURL))
            }
            
            let kpGallerys : KinopoiskGallerys = KinopoiskGallerys(gallery: gallery, gallery_SP: gallery_SP, posters: posters)
            
            completion(kpGallerys)
            
        }
    
    }

}
