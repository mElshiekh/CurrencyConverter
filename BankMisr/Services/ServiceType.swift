//
//  ServiceType.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import Foundation

protocol Endpoints {
    func getMethod() -> NetworkConstants.HttpMethods
    func getValue() -> String
    func getHeaders() -> [String: String]
    func getHttpBody() -> Data?
}

class ServiceType {
    var networkManager = NetworkManager.shared
    var baseURL: String {
        Bundle.main.object(forInfoDictionaryKey: "base_url") as? String ?? ""
    }

    var apiKey: String {
        Bundle.main.object(forInfoDictionaryKey: "api_key") as? String ?? ""
    }

    func getFullUrl(baseUrl: String,
                    endPoint: String,
                    parameters: [String: String]? = nil) -> String {
        let urlString = "\(baseUrl)\(endPoint)"
        var components = URLComponents()
        components.path = urlString
        components.queryItems = []
        if let params = parameters {
            for key in params.keys {
                components.queryItems?.append(URLQueryItem(name: key, value: params[key]!))
            }
            return (components.url?.absoluteString.removingPercentEncoding?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? urlString)
        }
        return urlString
    }
}

extension ServiceType {
    func buildDefaultURL(endPoint: Endpoints,
                         parameters: [String: String]? = nil) -> String {
        var params = parameters ?? [:]
        params["access_key"] = apiKey
        return getFullUrl(baseUrl: baseURL,
                          endPoint: endPoint.getValue(),
                          parameters: params)
    }
}
