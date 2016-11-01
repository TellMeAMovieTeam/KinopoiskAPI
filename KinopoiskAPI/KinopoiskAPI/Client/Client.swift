//
//  Client.swift
//  KinopoiskAPI
//
//  Created by Илья on 01.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation


class HTTPRequest{
    
    
    /// Запрос по HTTP
    ///
    /// - parameter urlString:  URL-строка с запросом
    /// - parameter completion: Для строки в которой хранится результат в виде JSON-объектов
    static func request(urlString: String, completion: @escaping (String) -> ()) {
        
        //преобразование строки в URL
        let url = URL(string: urlString)!
        
        //асинхронный сетевой запрос
        URLSession.shared.dataTask(with:url) { (data, response, error) in
           
            //если есть какая-либо ошибка
            if error != nil {
                print(error!)
                completion("")
            } else {
                if let response = response, let data = data {
                    //print(response)
                    let result : String = (String(data: data, encoding: .utf8))!
                    completion(result)
                } else {
                    completion("")
                }
            }
            }.resume()
    }
    
}
