//
//  ReactorViewController.swift
//  ReactorKitPractice
//
//  Created by 박연배 on 2022/03/05.
//

import UIKit
import RxSwift
import ReactorKit

final class ReactorViewController: UIViewController, View {
    
    //MARK: Properties
    var disposeBag = DisposeBag()
    
    
    //MARK: UI
    let mainView = LottoView()
    
    
    //MARK: Method
    
    func bind(reactor: LottoViewReactor) {
        
    }
    
    //MARK: LifeCycle
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
