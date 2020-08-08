//
//  Book.swift
//  BooksForSale
//
//  Created by Juan Felipe Gallo on 8/08/20.
//  Copyright © 2020 Juan Felipe Gallo. All rights reserved.
//

import Foundation

struct Book: Codable, Identifiable {
    var id = UUID()
    let title: String?
    let author: String?
    let imageURL: String?
}
