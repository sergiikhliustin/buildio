//
// V0BuildParamsEnvironment.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct V0BuildParamsEnvironment: Codable {

    public let isExpand: Bool?
    public let mappedTo: String?
    public let value: String?

    public init(isExpand: Bool? = nil, mappedTo: String? = nil, value: String? = nil) {
        self.isExpand = isExpand
        self.mappedTo = mappedTo
        self.value = value
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case isExpand = "is_expand"
        case mappedTo = "mapped_to"
        case value
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(isExpand, forKey: .isExpand)
        try container.encodeIfPresent(mappedTo, forKey: .mappedTo)
        try container.encodeIfPresent(value, forKey: .value)
    }
}
