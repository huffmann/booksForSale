//
//  Service.swift
//  BooksForSale
//
//  Created by Juan Felipe Gallo on 8/08/20.
//  Copyright © 2020 Juan Felipe Gallo. All rights reserved.
//

import Foundation

public enum Response<T> {
    case failure
    case success(objects: [T])
}

public typealias ServiceClosure<T> = (Response<T>) -> Void
