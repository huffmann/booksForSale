//
//  ViewModel.swift
//  BooksForSale
//
//  Created by Juan Felipe Gallo on 8/08/20.
//  Copyright © 2020 Juan Felipe Gallo. All rights reserved.
//

import Foundation

class BookListViewModel: ObservableObject {
        
    @Published var books: [Book] = []

    init() {
        // ViewModel loads data it is required to show once instantiated
        self.getBookList()
    }
    
    struct Dependencies {
        let getBooks: GetBooks = GetBooksAdapter()
    }
    let dependencies = Dependencies()
}

extension BookListViewModel {
        
    func getBookList() {
        dependencies.getBooks.execute { (response ) in
            
            switch response {
            case .success(let books):
                DispatchQueue.main.async {
                    self.books = books
                }
            case .failure:
                print("Failed to fetch books")
            }
        }
    }
}
