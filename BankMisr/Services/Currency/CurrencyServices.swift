//
//  CurrencyServices.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//  Copyright (c) 2023. All rights reserved.
//

import RxSwift

enum CurrencyEndpoints: String, Endpoints {
    case latest
    case symbols

    func getMethod() -> NetworkConstants.HttpMethods {
        switch self {
        case .latest:
            return .get
        case .symbols:
            return .get
        }
    }

    func getValue() -> String {
        switch self {
        case .latest:
            return "latest"
        case .symbols:
            return "symbols"
        }
    }

    func getHeaders() -> [String: String] {
        return [:]
    }

    func getHttpBody() -> Data? {
        return nil
    }
}

class CurrencyServices: ServiceType, CurrencyServicesProtocol {
    func getCurrencies() -> RxSwift.Observable<CurrenciesResponse?> {
        let endpoint = CurrencyEndpoints.symbols
        let url = buildDefaultURL(endPoint: endpoint)
        return networkManager.processRequest(url: url,
                                             method: endpoint.getMethod(),
                                             returnType: CurrenciesResponse.self)
    }
    
    func getLatest() -> Observable<ConvertResponse?> {
        let endpoint = CurrencyEndpoints.latest
        let url = buildDefaultURL(endPoint: endpoint)
        return networkManager.processRequest(url: url,
                                             method: endpoint.getMethod(),
                                             returnType: ConvertResponse.self)
    }
}
