//
//  ListView.swift
//  BooksForSale
//
//  Created by Juan Felipe Gallo on 8/08/20.
//  Copyright © 2020 Juan Felipe Gallo. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

protocol BooksList {
    func displayError()
}

struct BooksListView: View, BooksList {
    @ObservedObject var viewModel: BookListViewModel
    var body: some View {
        VStack {
            List(viewModel.books) { book in
                BookCell(book: BookViewModel.init(model: book))
            }
            HStack {
                Spacer()
                Text("Total Books \(self.viewModel.books.count)")
                    .foregroundColor(.secondary)
            }
        }
    }
    
    func displayError() {
        print("display error")
    }
    
}

struct BookCell: View {
    @ObservedObject var book: BookViewModel
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 5) {
                book.loadImage()
                VStack(alignment: .leading, spacing: 5) {
                    book.title.font(.headline)
                    book.author.font(.subheadline)
                }
            }
        }
    }
}

