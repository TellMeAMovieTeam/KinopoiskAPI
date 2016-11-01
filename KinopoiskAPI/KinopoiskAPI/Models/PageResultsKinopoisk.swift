//
//  PageResultsKinopoisk.swift
//  KinopoiskAPI
//
//  Created by Илья on 01.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

public struct PageResultsKinopoisk{
    
    public var page: Int!
    public var total_results: Int!
    public var total_pages: Int!
    
    public init(results: JSON){
        page = results["page"].int!
        total_results = results["total_results"].int!
        total_pages = results["total_pages"].int!
    }
}
