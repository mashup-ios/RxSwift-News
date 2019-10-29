//
//  ViewController.swift
//  News
//
//  Created by 이병찬 on 2019/10/05.
//  Copyright © 2019 이병찬. All rights reserved.
//

import UIKit
import RxSwift

class ViewController<VB>: UIViewController {
    var disposeBag = DisposeBag()
    
    func bind(_ viewModel: VB) { }
    
    func attribute() { }
    
    func layout() { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        attribute()
        layout()
    }
}
