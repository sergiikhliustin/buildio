//
// V0ProxyErrorRespModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct V0ProxyErrorRespModel: Codable {

    public let errorMsg: String?

    public init(errorMsg: String? = nil) {
        self.errorMsg = errorMsg
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case errorMsg = "error_msg"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(errorMsg, forKey: .errorMsg)
    }
}
