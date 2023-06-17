//
//  HomeViewController.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import UIKit

class HomeViewController: UIViewController {
    var viewModel: HomeViewModelProtocol?
    var coordinator: HomeCoordinatorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel?.getCurrencies()
        viewModel?.getFxRateFor(from: "USD", to: "EGP", amount: 10)
    }
}
