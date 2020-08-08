//
//  BookViewModel.swift
//  BooksForSale
//
//  Created by Juan Felipe Gallo on 8/08/20.
//  Copyright © 2020 Juan Felipe Gallo. All rights reserved.
//

import Foundation
import SwiftUI
import KingfisherSwiftUI

class BookViewModel: ObservableObject {
    let model: Book
    let title: BookLabel?
    let author: BookLabel?
    
    init(model: Book) {
        self.model = model
        self.title = BookLabel(text: model.title ?? "Unknown Title")
        self.author = BookLabel(text: model.author ?? "Unknown Author")
    }
    
    func loadImage() -> KFImage? {
        return KFImage(URL(string: model.imageURL ?? ""))
    }
}

struct BookLabel: View {
    let text: String
    var body: some View {
        Text("\(text)")
    }
}
