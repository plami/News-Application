//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by plamena on 7.06.19.
//  Copyright © 2019 plamena. All rights reserved.
//
import UIKit
import RxSwift

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    fileprivate func setup() {
        titleLabel.textColor = UIColor.blue
    }
    
}

extension ArticleTableViewCell: ArticleConfigurable {
    
    func configure(with article: ArticleViewModel) {
        article.title.asDriver(onErrorJustReturn: "")
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        article.description.asDriver(onErrorJustReturn: "")
            .drive(descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        //        titleLabel.text = article.title
        //        descriptionLabel.text = article.description
    }
}
