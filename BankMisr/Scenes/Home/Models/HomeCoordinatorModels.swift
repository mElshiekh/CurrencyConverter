//
//  HomeCoordinatorModels.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import UIKit

protocol HomeCoordinatorModelProtocol {
    var navigationController: UINavigationController? { get set }
}

struct HomeCoordinatorModel: HomeCoordinatorModelProtocol {
    var navigationController: UINavigationController?
}

struct CurrencyConversionData {
    var from: String
    var to: String
    var amount: String
    var rate: String
    var result: String
}
