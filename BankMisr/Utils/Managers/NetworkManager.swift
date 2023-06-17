//
//  NetworkManager.swift
//  BankMisr
//
//  Created by Mohamed ElSheikh on 17/06/2023.
//

import RxSwift

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}
    func processRequest<T>(url: String,
                           method: NetworkConstants.HttpMethods,
                           httpData: Data?,
                           returnType: T.Type) -> Observable<T?> where T: Codable {
        let objResponse = PublishSubject<T?>()
        if let url = URL(string: url) {
            var request = URLRequest(
                url: url,
                cachePolicy: .reloadIgnoringLocalCacheData
            )
            request.httpMethod = method.rawValue
            request.httpBody = httpData
            let task = URLSession.shared.dataTask(
                with: request,
                completionHandler: { [weak self] data, _, error in
                    if let error = error {
                        self?.handleErrorResponse(error: error,
                                                  objResponse: objResponse)
                    } else if let data = data {
                        self?.parseResponse(data: data, objResponse: objResponse)
                    } else {
                        self?.buildErrorResponse(message: nil,
                                                 errorType: .serverError,
                                                 objResponse: objResponse)
                    }
                }
            )

            task.resume()
        } else {
            buildErrorResponse(message: nil,
                               errorType: .invalidURL,
                               objResponse: objResponse)
        }
        return objResponse
    }

    fileprivate func parseResponse<T>(data: Data?,
                                      objResponse: PublishSubject<T?>) where T: Codable {
        if let data = data {
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                objResponse.onNext(response)
                objResponse.onCompleted()
            } catch {
                buildErrorResponse(message: nil,
                                   errorType: .parsingError,
                                   objResponse: objResponse)
            }
        }
    }

    func buildErrorResponse<T>(message: String?,
                               errorType: NetWorkError.Types,
                               objResponse: PublishSubject<T?>) {
        objResponse.onNext(nil)
        objResponse.onError(NetWorkError(message: message, type: errorType))
        objResponse.onCompleted()
    }

    func handleErrorResponse<T>(error: Error,
                                objResponse: PublishSubject<T?>) {
        buildErrorResponse(message: nil,
                           errorType: .serverError,
                           objResponse: objResponse)
    }
}
