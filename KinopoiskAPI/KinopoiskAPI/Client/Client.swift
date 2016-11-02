//
//  Client.swift
//  KinopoiskAPI
//
//  Created by Илья on 01.11.16.
//  Copyright © 2016 IlyaGutnikov. All rights reserved.
//

import Foundation

public struct ClientReturn{
    public var error: NSError?
    public var data: Data?
    public var response: URLResponse?
}

class HTTPRequest{
    
    
    /// Запрос по HTTP
    ///
    /// - parameter urlString:  URL-строка с запросом
    /// - parameter completion: Для строки в которой хранится результат в виде JSON-объектов
    static func request(urlString: String, completion: @escaping (ClientReturn) -> ()) {
        
        //преобразование строки в URL
        let url = URL(string: urlString)!
        var clientReturn : ClientReturn = ClientReturn()
        //асинхронный сетевой запрос
        URLSession.shared.dataTask(with:url) { (data, response, error) in
            
            //если есть какая-либо ошибка
            if error != nil {
                
                //То запихиваем ошибку в структуру
                clientReturn.error = error as NSError?
                clientReturn.data = nil
                clientReturn.response = nil
                
                // и печатаем ошибку
                print("HTTPRequest error: \(error!)")
                
                completion(clientReturn)
                
            } else {
                //если данные нормально преобразовались, то выдаем их
                if let response = response, let data = data {
                    
                    //let result : String = (String(data: data, encoding: .utf8))!
                    
                    clientReturn.data = data
                    clientReturn.response = response
                    clientReturn.error = nil
                    
                    completion(clientReturn)
                    
                } else {
                    
                    //если данные не преобразовались, то заполняем все nil-ми
                    clientReturn.data = nil
                    clientReturn.response = nil
                    clientReturn.error = nil
                    
                    completion(clientReturn)
                }
            }
            }.resume()
    }
    
}
