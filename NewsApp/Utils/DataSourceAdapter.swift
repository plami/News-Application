//
//  DataSourceAdapter.swift
//  NewsApp
//
//  Created by plamena on 7.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import UIKit

class DataSourceAdapter: NSObject, UITableViewDataSource {
    
    private var itemsInSection: Int = 0
    private let reuseIdentifier: String
    private var articleListVM: ArticleListViewModel!
    
    weak var delegate: DataSourceAdapterDelegate?
    
    init(cellReuseIdentifier: String) {
        self.reuseIdentifier = cellReuseIdentifier
    }
    
    func setItems(numberOfItemsInSection: Int){
        self.itemsInSection = numberOfItemsInSection
    }
    
    func injectData(articlesVMInjected: ArticleListViewModel!){
        self.articleListVM = articlesVMInjected
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell is not found") }
        cell.configure(with: self.articleListVM.articlesVM[indexPath.row])
        return cell
    }
}

extension DataSourceAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

protocol DataSourceAdapterDelegate: class {
    func populateNews()
}


