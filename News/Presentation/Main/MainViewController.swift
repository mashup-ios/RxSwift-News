//
//  MainViewController.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import UIKit

class MainViewModel {
    let newsViewModel = NewsViewModel()
    let storedNewsViewModel = StoredNewsViewModel()
}

class MainViewController: UITabBarController {
    let newsViewController = NewsViewController()
    let storedNewsViewController = NewsViewController()
    
    let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        newsViewController.do {
            $0.bind(viewModel.newsViewModel)
            $0.tabBarItem = UITabBarItem(title: "뉴스", image: nil, tag: 1)
        }
        storedNewsViewController.do{
            $0.bind(viewModel.storedNewsViewModel)
            $0.tabBarItem = UITabBarItem(title: "저장된 뉴스", image: nil, tag: 2)
        }
        
        setViewControllers([newsViewController, storedNewsViewController], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

