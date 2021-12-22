// Models.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

protocol JSONEncodable {
    func encodeToJSON() -> Any
}

private struct BitriseError: Decodable {
    let message: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let error_msg = try? container.decode(String.self, forKey: .error_msg) {
            message = error_msg
        } else {
            message = try container.decode(String.self, forKey: .message)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case message
        case error_msg
    }
}

public enum ErrorResponse: Error, Identifiable {
    public var id: String { rawErrorString }
    
    case empty
    case error(Int, Data?, URLResponse?, Error)
    case custom(String)
    
    public var rawErrorString: String {
        if case let .error(code, data, _, rawError) = self {
            if code == 401 {
                return "Token expired or invalid"
            } else if let data = data, let string = try? JSONDecoder().decode(BitriseError.self, from: data).message {
                return string
            }
            return rawError.localizedDescription
        } else if case let .custom(string) = self {
            return string
        }
        return self.localizedDescription
    }
}

public enum DownloadException: Error {
    case responseDataMissing
    case responseFailed
    case requestMissing
    case requestMissingPath
    case requestMissingURL
}

public enum DecodableRequestBuilderError: Error {
    case emptyDataResponse
    case nilHTTPResponse
    case unsuccessfulHTTPStatusCode
    case jsonDecoding(DecodingError)
    case generalError(Error)
}

open class Response<T> {
    public let statusCode: Int?
    public let header: [String: String]?
    public let body: T?

    public init(statusCode: Int? = nil, header: [String: String]? = nil, body: T?) {
        self.statusCode = statusCode
        self.header = header
        self.body = body
    }

    public convenience init(response: HTTPURLResponse, body: T?) {
        let rawHeader = response.allHeaderFields
        var header = [String: String]()
        for (key, value) in rawHeader {
            if let key = key.base as? String, let value = value as? String {
                header[key] = value
            }
        }
        self.init(statusCode: response.statusCode, header: header, body: body)
    }
}
