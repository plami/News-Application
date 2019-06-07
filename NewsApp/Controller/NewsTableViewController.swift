//
//  ViewController.swift
//  NewsApp
//
//  Created by plamena on 7.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Rswift

class NewsTableViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    
    private var articleListVM: ArticleListViewModel!
    
    private var newsDataSource: DataSourceAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        setUpTableView()
        
        populateNews()
    }
}

private extension NewsTableViewController {
    
    func setUpTableView() {
        newsDataSource = DataSourceAdapter(cellReuseIdentifier: R.reuseIdentifier.articleTableViewCell.identifier)
        
        newsDataSource.delegate = self
        
        tableView.dataSource = newsDataSource
        tableView.delegate = newsDataSource
    }
}

extension NewsTableViewController: DataSourceAdapterDelegate {
    
    internal func populateNews() {
        
        let resource = Resource<ArticleList>(url: URL(string: Constants.APIService.url)!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                
                guard let articles = articleResponse?.articles else { return }
                self.articleListVM = ArticleListViewModel(articles)
                
                self.newsDataSource.injectData(articlesVMInjected: self.articleListVM)
                self.newsDataSource.setItems(numberOfItemsInSection: (self.articleListVM.articlesVM.count))
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }).disposed(by: disposeBag)
    }
}


