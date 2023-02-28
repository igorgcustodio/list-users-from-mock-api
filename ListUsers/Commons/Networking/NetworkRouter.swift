//
//  NetworkRouter.swift
//  ListUsers
//
//  Created by Igor Custodio on 27/02/23.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

public class NetworkRouter {

    let session: URLSession

    public init(session: URLSession) {
        self.session = session
    }


    @discardableResult
    public func performRequest<T: Decodable>(
        for route: EndpointType,
        decodingType: T.Type,
        completion: @escaping (Result<T, ErrorType>) -> Void
    ) -> URLSessionDataTask? {
        func handle(error: Error)  {
            if error.isTaskCancelled {
                completion(.failure(.cancelled))
            }

            if error.isConnectivityError {
                completion(.failure(.timeout))
            }
        }

        let task = doRequest(route) { data, response, error in
            print("task completed")

            if let error {
                handle(error: error)
            }

            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }

            if let responseError = self.handleResponseStatusCode(response) {
                completion(.failure(responseError))
                return
            }

            guard let responseData = data else {
                completion(.failure(.noData))
                return
            }

            let statusCode = response.statusCode
            let responseHeaders = response.allHeaderFields as? [String: String] ?? [:]

            self.decode(
                type: .api,
                responseData: responseData,
                responseHeaders: responseHeaders,
                statusCode: statusCode,
                completion: completion
            )
        }

        return task
    }

    private func decode<T: Decodable>(
        type: HTTPResponse<T>.ResponseType,
        responseData: Data,
        responseHeaders: [String: String],
        statusCode: Int,
        completion: @escaping (Result<T, ErrorType>) -> Void
    ) {
        DispatchQueue.global(qos: .background).sync {
            do {
                let decoder = JSONDecoder()
                let dateFormatter = self.decoderDateFormatter()
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let decodedData = try decoder.decode(T.self, from: responseData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.failedToDecode))
            }
        }
    }

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.timeZone = TimeZone(identifier: "America/New_York")
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        return dateFormatter
    }()

    private func decoderDateFormatter() -> DateFormatter {
        // Set date format
        let dateDecodeStrategyFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        // Date formatter
        let dateFormatter = dateFormatter
        dateFormatter.dateFormat = dateDecodeStrategyFormat

        return dateFormatter
    }

    private func handleResponseStatusCode(_ response: HTTPURLResponse) -> ErrorType? {
        switch response.statusCode {
        case 200...299:
            return nil
        case 404:
            return .notFound
        case 400...499:
            return .badRequest
        case 500...600:
            return .serverError
        default:
            return .defaultError(statusCode: response.statusCode)
        }
    }

    @discardableResult
    private func doRequest(_ route: EndpointType, completion: @escaping NetworkRouterCompletion) -> URLSessionDataTask? {
        do {
            let request = try createRequest(for: route)
            print(request)
            let task = session.dataTask(with: request) { data, response, error in
                completion(data, response, error)
            }
            task.resume()
            return task
        } catch {
            completion(nil, nil, error)
            print(error)
            return nil
        }
    }

    private func createRequest(for route: EndpointType) throws -> URLRequest {
        guard let url = route.url
        else {
            throw ErrorType.failedToParseUrl
        }
        var request = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: route.timeout
        )

        request.httpMethod = route.method.description
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if route.method != .get {
            try buildBody(for: route, request: &request)
        }

        return request
    }

    private func buildBody(for route: EndpointType, request: inout URLRequest) throws {
        if let body = route.body {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                request.httpBody = jsonData
            } catch {
                throw ErrorType.failedToEncode
            }
        }
    }
}
