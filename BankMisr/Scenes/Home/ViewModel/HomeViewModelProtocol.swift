//
//  HomeViewModelProtocol.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import RxSwift
import RxCocoa

protocol HomeViewModelProtocol: AnyObject {
    var service: CurrencyServicesProtocol? { get set }
    var currenciesViewData: BehaviorRelay<[String: String]> { get set }
    var fxViewData: BehaviorRelay<CurrencyConversionData?> { get set }
    var isLoadingViewData: BehaviorRelay<Bool?> { get set }
    var errorViewData: BehaviorRelay<NetWorkError?> { get set }
    func getFxRateFor(from: String, to: String, amount: Double)
    func getCurrencies()
}
