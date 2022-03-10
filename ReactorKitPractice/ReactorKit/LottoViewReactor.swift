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
        case fetchLotto
    }
    
    struct State {
        var lottoInfo: Lotto?
    }
}
