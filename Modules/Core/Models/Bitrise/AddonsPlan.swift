//
// AddonsPlan.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct AddonsPlan: Codable {

    public let features: [AddonsFeature]?
    public let id: String?
    public let name: String?
    public let price: Int?

    public init(features: [AddonsFeature]? = nil, id: String? = nil, name: String? = nil, price: Int? = nil) {
        self.features = features
        self.id = id
        self.name = name
        self.price = price
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case features
        case id
        case name
        case price
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(features, forKey: .features)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(price, forKey: .price)
    }
}
