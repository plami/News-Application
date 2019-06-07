//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by plamena on 30.04.19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//this is the root viewmodel, which includes all articles
struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
}

extension ArticleListViewModel {
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        return articlesVM[index]
    }
}

struct ArticleViewModel {
    
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    //with just we are transforming the value to Observable
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}
