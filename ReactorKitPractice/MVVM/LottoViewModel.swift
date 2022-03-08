//
//  LottoViewModel.swift
//  ReactorKitPractice
//
//  Created by 박연배 on 2022/03/05.
//

import Foundation
import RxSwift
import RxCocoa

final class LottoViewModel {
    
    struct Input {
        let refreshButtonClicked: Observable<Void>
    }
    
    struct Output {
        let lottoData: Driver<Lotto?>
    }
    
    func transform(input: Input) -> Output {
        let lottoData = input.refreshButtonClicked
            .flatMap { APIService.shared.fetchLottoData(drwNo: Int.random(in: 1...1000)) }
            .debug("로또")
            .asDriver(onErrorJustReturn: nil)

        return Output(lottoData: lottoData)
    }    
    
    init() {
        
    }
}
