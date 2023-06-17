//
//  NetworkError.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import Foundation
struct NetWorkError: Error {
    enum Types: Int {
        case serverError = 500
        case invalidURL = 601
        case parsingError = 602
        case noInternet = 603
        case unAuthenticated = 401
        
        var defaultMessage: String {
            switch self {
            case .serverError:
                return "Server error"
            case .invalidURL:
                return "Server error"
            case .noInternet:
                return "Please check your internet"
            case .parsingError:
                return "Server error"
            case .unAuthenticated:
                return "Session expired please relogin"
            }
        }
    }
    var message: String?
    var type: Types
}
