//
//  ViewController.swift
//  ACNoonbody
//
//  Created by DevKang on 2017. 6. 10..
//  Copyright © 2017년 DevKang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import ReactorKit

class MainViewController: UIViewController, View {
    
    @IBOutlet weak var fetchMeBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    var disposeBag: DisposeBag = DisposeBag()
    
    func bind(reactor: MainViewReactor) {
        self.fetchMeBtn
            .rx
            .tap
            .map { Reactor.Action.fetch }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.name }
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.reactor = MainViewReactor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

