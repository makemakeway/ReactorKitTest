//
//  LottoViewReactor.swift
//  ReactorKitPractice
//
//  Created by 박연배 on 2022/03/05.
//

import Foundation
import ReactorKit
import RxSwift

final class LottoViewReactor: Reactor {
    var initialState: State = State()
    
    enum Action {
        case reload
    }
    
    enum Mutation {
        case fetchLotto(Lotto)
    }
    
    struct State {
        var lottoInfo: Lotto?
    }
    
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .reload:
            let num = Int.random(in: 1...1000)
            return APIService.shared.fetchLottoData(drwNo: num)
                .asObservable()
                .filter { $0 != nil }
                .map { lotto in Mutation.fetchLotto(lotto!) }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .fetchLotto(let lotto):
            newState.lottoInfo = lotto
        }
        return newState
    }
}
