//
//  ViewController.swift
//  ReactorKitPractice
//
//  Created by 박연배 on 2022/03/04.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {

    
    //MARK: Properties
    private var disposeBag = DisposeBag()
    private var viewModel = LottoViewModel()
    
    private lazy var input = LottoViewModel.Input(refreshButtonClicked: mainView.refreshButton.rx.tap.asObservable())
    
    private lazy var output = viewModel.transform(input: input)
    
    //MARK: UI
    let mainView = LottoView()
    
    
    //MARK: Method
    func bind() {
        output.lottoData.drive(with: self) { owner, lotto in
            guard let lotto = lotto else { return }
            owner.mainView.firstLabel.text = "\(lotto.drwtNo1)"
            owner.mainView.secondLabel.text = "\(lotto.drwtNo2)"
            owner.mainView.thirdLabel.text = "\(lotto.drwtNo3)"
            owner.mainView.fourthLabel.text = "\(lotto.drwtNo4)"
            owner.mainView.fifthLabel.text = "\(lotto.drwtNo5)"
            owner.mainView.sixthLabel.text = "\(lotto.drwtNo6)"
            owner.mainView.bonusLabel.text = "\(lotto.bnusNo)"
            owner.mainView.episodeLabel.text = "\(lotto.drwNo)회차"
        }
        .disposed(by: disposeBag)
    }
    
    
    //MARK: LifeCycle
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}

