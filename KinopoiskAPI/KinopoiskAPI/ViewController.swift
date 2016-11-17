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
        
        KinopoiskGallery.getGallery(filmID: 714888)
        print(KinopoiskGallery.gallery)
    }
    
    @IBAction func getGenres(_ sender: AnyObject) {
        
        KinopoiskGenres.getGenres()
        print(KinopoiskGenres.genres)
    }

    @IBAction func getFilm(_ sender: AnyObject) {
        
        KinopoiskFilm.getFilm(filmID: 714888)
        print(KinopoiskFilm.resultingFilm?.posterURL)
        print(KinopoiskFilm.resultingFilm?.nameEN)
        print(KinopoiskFilm.resultingFilm?.description)
        
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

