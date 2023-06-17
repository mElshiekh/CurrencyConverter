//
//  ConvertResponse.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import Foundation

// MARK: - ConvertResponse
struct ConvertResponse: Codable {
    var success: Bool?
    var timestamp: Int?
    var base, date: String?
    var rates: [String: Double]?
}
