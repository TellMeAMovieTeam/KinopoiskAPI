//
//  ViewController.swift
//  KinopoiskAPI
//
//  Created by Илья on 21.10.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getStaff(_ sender: AnyObject) {
        
        KinopoiskStaff.getStaff(filmID: 714888)
        print(KinopoiskStaff.staff.count)
        
    }
    @IBAction func searchFilms(_ sender: AnyObject) {
        
        KinopoiskSearchFilms.searchFilm(Keyword: "Звездные")
        print(KinopoiskSearchFilms.pagesCount)
    }
    
    @IBAction func getCountry(_ sender: AnyObject) {
        
        KinopoiskCountry.getCountrys()
        print(KinopoiskCountry.countrys)
    }
    
    @IBAction func getGallery(_ sender: AnyObject) {
        
        KinopoiskGallery.getGallery(filmID: 714888) { result in
            
            print(result.gallery)
            print(result.gallery_SP)
            print(result.posters)
            
        }
    }
    
    @IBAction func getGenres(_ sender: AnyObject) {
        
        KinopoiskGenres.getGenres() { result in
        
            print(result)
        }
    }

    @IBAction func getFilm(_ sender: AnyObject) {
        
        var filmData : Film?
        
        KinopoiskFilm.getFilm(filmID: 714888) { result in
            
            filmData = result
            
            print(filmData?.nameEN)
            print(filmData?.nameRU)
            print(filmData?.description)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

