//
//  GetBooksWebService.swift
//  BooksForSale
//
//  Created by Juan Felipe Gallo on 8/08/20.
//  Copyright © 2020 Juan Felipe Gallo. All rights reserved.
//

import Foundation

final class GetBooksWebService {
    
    let urlString = "http://de-coding-test.s3.amazonaws.com/books.json"
    func getBooks(completion: @escaping ServiceClosure<Book>) {
                
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        session.perform(request, decode: [Book].self) { (result) in
            switch result {
            case .failure:
                print("error")
            case .success(let books):
                completion(.success(objects: books))
            }
        }
    }
}

extension URLSession {
    
    func perform<T: Decodable>(_ request: URLRequest, decode decodable: T.Type, result: @escaping (Result<[Book], Error>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // handle error scenarios `result(.failure(responseError))`
                  
            do {
                
                let jsonArray = try JSONSerialization.jsonObject(with: data!, options: []) as? [Dictionary<String, Any>]
                let books = jsonArray?.compactMap { book -> Book in
                    let title = book["title"] as? String
                    let author = book["author"] as? String
                    let imageURL =  book["imageURL"] as? String
                    return Book(title: title, author: author, imageURL: imageURL)
                }
                
//                let object = try JSONDecoder().decode([Book].self, from: data!)
                result(.success(books!))
                
            } catch {
                result(.failure(error))
            }
            
        }.resume()
    }
    
}
