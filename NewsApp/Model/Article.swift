//
//  Article.swift
//  NewsApp
//
//  Created by plamena on 7.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//
import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}

