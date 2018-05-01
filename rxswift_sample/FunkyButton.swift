//
//  FunkyButton.swift
//  rxswift_sample
//
//  Created by Mayckon Barbosa da Silva on 5/1/18.
//  Copyright © 2018 Mayckon Barbosa da Silva. All rights reserved.
//
import UIKit
import RxCocoa
import RxSwift

class FunkyButton: UIButton {
    
    
    var viewModel: FunkyButtonViewPresentable
    var disposeBag = DisposeBag()
    required init?(coder aDecoder: NSCoder) {
        fatalError("not implemented")
    }
    
    required init(viewModel: FunkyButtonViewPresentable){
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        self.backgroundColor = viewModel.backgroundColor
        self.setTitle(viewModel.title, for: .normal)
        
        self.rx.tap.bind {
            self.viewModel.funkyTapPublishSubject.onNext(self.viewModel.title)
            print("funky button with title = \(viewModel.title) is tapped!")
        }.disposed(by: disposeBag)
        
    }
}
