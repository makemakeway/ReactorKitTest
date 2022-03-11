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
    var reactor: LottoViewReactor
    
    //MARK: UI
    let mainView = LottoView()
    
    
    //MARK: Method
    
    func bind(reactor: LottoViewReactor) {
        print(#function)
        
        mainView.refreshButton.rx.tap
            .map { Reactor.Action.reload }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.lottoInfo }
            .bind(with: self) { owner, lotto in
                guard let lotto = lotto else { return }
                owner.mainView.firstLabel.text = "\(lotto.drwtNo1)"
                owner.mainView.secondLabel.text = "\(lotto.drwtNo2)"
                owner.mainView.thirdLabel.text = "\(lotto.drwtNo3)"
                owner.mainView.fourthLabel.text = "\(lotto.drwtNo4)"
                owner.mainView.fifthLabel.text = "\(lotto.drwtNo5)"
                owner.mainView.sixthLabel.text = "\(lotto.drwtNo6)"
                owner.mainView.bonusLabel.text = "\(lotto.bnusNo)"
                owner.mainView.episodeLabel.text = "\(lotto.drwNo)"
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: LifeCycle
    init(reactor: LottoViewReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
