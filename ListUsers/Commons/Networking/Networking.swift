//
//  Networking.swift
//  ListUsers
//
//  Created by Igor Custodio on 28/02/23.
//

import Foundation
import Alamofire

public enum NetworkingErrorType: Error {

    case generic
    case invalidURL

    public var localizedDescription: String {
        switch self {
        case .generic:
            return "Error on request"
        case .invalidURL:
            return "Invalid URL"
        }
    }
}

public protocol NetworkingProtocol: AnyObject {
    func request<T: Decodable>(
        path: String,
        method: HTTPMethod,
        headers: HTTPHeaders?,
        parameters: Parameters?,
        completion: @escaping (Result<T, NetworkingErrorType>) -> Void
    )
}

public final class Networking: NetworkingProtocol {

    private let decoderQueue: DispatchQueue

    public init(decoderQueue: DispatchQueue = .global(qos: .utility)) {
        self.decoderQueue = decoderQueue
    }

    public func request<T: Decodable>(
        path: String,
        method: HTTPMethod = .get,
        headers: HTTPHeaders? = nil,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, NetworkingErrorType>) -> Void
    ) {
        var allHeaders: HTTPHeaders = [
            "Accept": "application/json"
        ]
        if let headers {
            headers.forEach { header in
                allHeaders.add(header)
            }
        }
        AF
            .request(
                path,
                method: method,
                parameters: parameters,
                headers: allHeaders
            ) { urlRequest in
                self.logRequest(urlRequest)
            }
            .validate(contentType: ["application/json"])
            .responseDecodable(
                of: T.self,
                queue: decoderQueue
            ) { response in
                switch response.result {
                case let .success(data):
                    completion(.success(data))
                case let .failure(error):
                    completion(.failure(self.handleError(error)))
                }
            }
    }

    private func handleError(_ error: AFError) -> NetworkingErrorType {
        switch error {
        case .invalidURL:
            return .invalidURL
        default:
            return .generic
        }
    }

    private func logRequest(_ request: URLRequest) {
        var body: String = ""
        if let httpBody = request.httpBody {
            body = String(decoding: httpBody, as: UTF8.self)
        }
        print("⏱ MAKING REQUEST")
        print("⏱ METHOD: \(request.method?.rawValue ?? "")")
        print("⏱ URL: \(request.url?.absoluteString ?? "")")
        print("⏱ HEADERS: \(request.headers.description)")
        print("⏱ BODY: \(body)")
    }
}
