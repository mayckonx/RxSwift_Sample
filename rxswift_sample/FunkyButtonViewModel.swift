//
//  FunkyButtonViewModel.swift
//  rxswift_sample
//
//  Created by Mayckon Barbosa da Silva on 5/1/18.
//  Copyright © 2018 Mayckon Barbosa da Silva. All rights reserved.
//
import UIKit
import RxSwift

protocol FunkyButtonViewPresentable {
    var backgroundColor: UIColor{ get }
    var title: String { get }
    var funkyTapPublishSubject: PublishSubject<String> { get }
    
}

class FunkyButtonViewModel: FunkyButtonViewPresentable {

    var title: String = ""
    var backgroundColor: UIColor = UIColor.blue
    var funkyTapPublishSubject: PublishSubject<String> = PublishSubject()
    
    init(title: String) {
        self.title = title
    }
}
