//
//  ConvertRequest.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import Foundation

struct ConvertRequest: Codable {
    var from, to: String
    var amount: Double
    
    enum CodingKeys: String, CodingKey {
            case from = "from"
            case to = "to"
            case amount = "amount"
        }
}
