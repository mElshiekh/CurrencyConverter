//
//  HomeViewModel.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import RxCocoa
import RxSwift

class HomeViewModel: HomeViewModelProtocol {
    private var disposeBag = DisposeBag()
    var service: CurrencyServicesProtocol?
    var currenciesViewData = BehaviorRelay<[String: String]>(value: [:])
    var fxViewData = BehaviorRelay<CurrencyConversionData?>(value: nil)
    var isLoadingViewData = BehaviorRelay<Bool?>(value: nil)
    var errorViewData = BehaviorRelay<NetWorkError?>(value: nil)
    func getFxRateFor(from: String, to: String, amount: Double) {
        service?.getLatest()
            .asObservable()
            .subscribe(onNext: { [weak self] response in
                self?.isLoadingViewData.accept(false)
                if let resp = response,
                   let rateFrom = resp.rates?[from],
                   let rateTo = resp.rates?[to] {
                    let fxRate = rateTo / rateFrom
                    let result = fxRate * amount
                    let data = CurrencyConversionData(from: from,
                                           to: to,
                                           amount: "\(amount)",
                                           rate: "\(fxRate)",
                                           result: "\(result)")
                    self?.fxViewData.accept(data)
                }
            }, onError: { [weak self] respError in
                self?.isLoadingViewData.accept(false)
                if let error = respError as? NetWorkError {
                    self?.errorViewData.accept(error)
                }

            }).disposed(by: disposeBag)
    }

    func getCurrencies() {
        service?.getCurrencies()
            .asObservable()
            .subscribe(onNext: { [weak self] response in
                self?.isLoadingViewData.accept(false)
                if let resp = response?.symbols {
                    self?.currenciesViewData.accept(resp)
                    dump(resp)
                }
            }, onError: { [weak self] respError in
                self?.isLoadingViewData.accept(false)
                if let error = respError as? NetWorkError {
                    self?.errorViewData.accept(error)
                }
            }).disposed(by: disposeBag)
    }
}
