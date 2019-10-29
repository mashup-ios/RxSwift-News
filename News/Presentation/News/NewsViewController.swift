//
//  NewsViewController.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import RxAppState

protocol NewsViewBindable {
    var viewDidLoad: PublishSubject<Void> { get }
    var newsList: Observable<[News]> { get }
}

class NewsViewController: ViewController<NewsViewBindable> {
    let tableView = UITableView()
    
    let button = UIButton()
    
    override func bind(_ viewModel: NewsViewBindable) {
        self.disposeBag = DisposeBag()
        
        viewModel.newsList
            .drive(tableView.rx.items) { tv, row, news in
                let cell = tv.dequeueReusableCell(withIdentifier: "NEWSCELL", for: IndexPath(row: row, section: 0)) as! NewsCell
                cell.setData(news)
                return cell
            }
            .disposed(by: disposeBag)
        
//        tableView.rx.modelSelected(News.self)
//            .bind(to: viewModel.newsSelected)
//            .disposed(by: disposeBag)
        
        self.rx.viewDidLoad
            .bind(to: viewModel.viewDidLoad)
            .disposed(by: disposeBag)
    }
    
    override func attribute() {
        tableView.do {
            $0.register(NewsCell.self, forCellReuseIdentifier: "NEWSCELL")
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = 70
        }
    }
    
    override func layout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}
