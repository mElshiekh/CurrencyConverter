//
//  CurrenciesResponse.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import Foundation
// MARK: - ConvertResponse
struct CurrenciesResponse: Codable {
    var success: Bool?
    var symbols: [String: String]?
}
