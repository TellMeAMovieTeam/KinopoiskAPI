//
//  ViewController.swift
//  KinopoiskAPI
//
//  Created by Илья on 21.10.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func getFilm(_ sender: AnyObject) {
        
    var test = ""
        
      KinopoiskAPI.getFilm(filmID: 714888) { result in
            test = result
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

