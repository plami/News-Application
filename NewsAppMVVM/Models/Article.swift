//
//  Article.swift
//  NewsAppMVVM
//
//  Created by plamena on 30.04.19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}
