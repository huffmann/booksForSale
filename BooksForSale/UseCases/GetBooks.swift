//
//  GetBooks.swift
//  BooksForSale
//
//  Created by Juan Felipe Gallo on 8/08/20.
//  Copyright © 2020 Juan Felipe Gallo. All rights reserved.
//

import Foundation



protocol GetBooks {
    func execute(completion: @escaping ServiceClosure<Book>) 
}
