//
//  CurrencyServicesProtocol.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//  Copyright (c) 2023. All rights reserved.
//

import RxSwift

protocol CurrencyServicesProtocol: ServiceType {
    func getLatest() -> Observable<ConvertResponse?>
    func getCurrencies() -> Observable<CurrenciesResponse?>
}
