//
//  LottoView.swift
//  ReactorKitPractice
//
//  Created by 박연배 on 2022/03/05.
//

import UIKit
import SnapKit
import Then

final class LottoView: UIView {
    
    let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 0
        $0.distribution = .fillEqually
    }
    
    let firstLabel = UILabel().then {
        $0.textAlignment = .center
        $0.backgroundColor = .magenta
    }
    
    let secondLabel = UILabel().then {
        $0.textAlignment = .center
        $0.backgroundColor = .magenta
    }
    
    let thirdLabel = UILabel().then {
        $0.textAlignment = .center
        $0.backgroundColor = .magenta
    }
    
    let fourthLabel = UILabel().then {
        $0.textAlignment = .center
        $0.backgroundColor = .magenta
    }
    
    let fifthLabel = UILabel().then {
        $0.textAlignment = .center
        $0.backgroundColor = .magenta
    }
    
    let sixthLabel = UILabel().then {
        $0.textAlignment = .center
        $0.backgroundColor = .magenta
    }
    
    let bonusLabel = UILabel().then {
        $0.textAlignment = .center
        $0.backgroundColor = .orange
    }
    
    let refreshButton = UIButton().then {
        $0.backgroundColor = .systemBlue
        $0.setTitle("다른 회차 보기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }
    
    let episodeLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .purple
    }
    
    func setup() {
        [stackView, refreshButton, episodeLabel]
            .forEach {
                addSubview($0)
            }
        
        [firstLabel, secondLabel, thirdLabel, fourthLabel, fifthLabel, sixthLabel, bonusLabel]
            .forEach {
                stackView.addArrangedSubview($0)
            }
    }
    
    func setConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(30)
            make.height.equalTo(44)
        }
        
        episodeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        refreshButton.snp.makeConstraints { make in
            make.top.equalTo(episodeLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(44)
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
