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
        print(KinopoiskStaff.Staff.count)
        
    }
    @IBAction func searchFilms(_ sender: AnyObject) {
        
        KinopoiskSearchFilms.searchFilm(Keyword: "Звездные")
        print(KinopoiskSearchFilms.pagesCount)
    }
    
    @IBAction func getCountry(_ sender: AnyObject) {
        
        KinopoiskCountry.getCountrys()
        print(KinopoiskCountry.Countrys)
    }
    
    @IBAction func getGallery(_ sender: AnyObject) {
        
        KinopoiskGallery.getGallery(filmID: 714888)
        print(KinopoiskGallery.Gallery)
    }
    
    @IBAction func getGenres(_ sender: AnyObject) {
        
        KinopoiskGenres.getGenres()
        print(KinopoiskGenres.genres)
    }

    @IBAction func getFilm(_ sender: AnyObject) {
        
        KinopoiskFilm.getFilm(filmID: 714888)
        print(KinopoiskFilm.ResultingFilm?.PosterURL)
        print(KinopoiskFilm.ResultingFilm?.NameEN)
        
    /*var test = ""
        
      KinopoiskAPI.getFilm(filmID: 714888) { result in
            test = result
        }
        
    //print(test)
        
    var test2 = KinopoiskAPI.resultVar
        print(test2)
    */

        
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

