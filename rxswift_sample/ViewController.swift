//
//  ViewController.swift
//  rxswift_sample
//
//  Created by Mayckon Barbosa da Silva on 5/1/18.
//  Copyright © 2018 Mayckon Barbosa da Silva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol FunkyHomeViewPresentable {
    var funkyItems: [FunkyButtonViewPresentable] { get }
}

class FunkyHomeViewModel: FunkyHomeViewPresentable {
    var funkyItems: [FunkyButtonViewPresentable] = []
    
    init() {
        let one = FunkyButtonViewModel(title: "One")
        let two = FunkyButtonViewModel(title: "Two")
        let three = FunkyButtonViewModel(title: "Three")
        let four = FunkyButtonViewModel(title: "Four")
        let five = FunkyButtonViewModel(title: "Five")
        let six = FunkyButtonViewModel(title: "Six")
        
        funkyItems.append(contentsOf: [one, two, three, four, five, six])
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var stackViewContainer: UIStackView!
    @IBOutlet weak var lblButtonValue: UILabel!
    
    let disposeBag = DisposeBag()
    
    let viewModel = FunkyHomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewModel.funkyItems.forEach { (funkyViewModel) in
            let funkyButton = FunkyButton(viewModel: funkyViewModel)
            stackViewContainer.addArrangedSubview(funkyButton)
        }
        
        let funkyPublishObservableArray = viewModel.funkyItems.map({$0.funkyTapPublishSubject})
        Observable.merge(funkyPublishObservableArray)
            .map({$0.uppercased()})
            .bind(to: lblButtonValue.rx.text)
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

