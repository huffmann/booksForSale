//
//  GetBooksAdapter.swift
//  BooksForSale
//
//  Created by Juan Felipe Gallo on 8/08/20.
//  Copyright © 2020 Juan Felipe Gallo. All rights reserved.
//

import Foundation

final class GetBooksAdapter: GetBooks {
    
    struct Dependencies {
        let service = GetBooksWebService()
    }
    
    let dependencies: Dependencies
    
    func execute(completion: @escaping ServiceClosure<Book>) {
        dependencies.service.getBooks { (response) in
            switch response {
            case .failure:
                completion(.failure)
            case .success(let books):
                completion(.success(objects: books))
            }
        }
    }
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}
