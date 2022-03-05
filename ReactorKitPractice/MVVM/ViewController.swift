//
//  ViewController.swift
//  ReactorKitPractice
//
//  Created by 박연배 on 2022/03/04.
//

import UIKit

final class ViewController: UIViewController {

    
    //MARK: Properties
    
    
    
    //MARK: UI
    let mainView = LottoView()
    
    
    //MARK: Method
    
    
    
    //MARK: LifeCycle
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

