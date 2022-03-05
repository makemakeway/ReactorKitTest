//
//  APIService.swift
//  ReactorKitPractice
//
//  Created by 박연배 on 2022/03/05.
//

import Foundation
import Alamofire
import RxSwift

final class APIService {
    let shared = APIService()
    
    func fetchLottoData(drwNo: Int) -> Single<Lotto> {
        return Single.create { single in
            
            let urlString = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)"
            guard let url = URL(string: urlString) else { return Disposables.create() }
            
            AF.request(url, method: .get)
                .validate()
                .responseDecodable(of: Lotto.self) { response in
                    switch response.result {
                    case .success(let lotto):
                        single(.success(lotto))
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            return Disposables.create()
        }
    }
    
    
    private init() {
        
    }
    
}
