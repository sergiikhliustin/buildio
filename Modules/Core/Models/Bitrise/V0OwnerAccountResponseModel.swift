//
// V0OwnerAccountResponseModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct V0OwnerAccountResponseModel: Codable, Hashable, Sendable {
    public let accountType: String
    public let name: String
    public let slug: String

    public init(accountType: String, name: String, slug: String) {
        self.accountType = accountType
        self.name = name
        self.slug = slug
    }

    public static func preview() -> Self {
        return Self(accountType: "accountType", name: "name", slug: "slug")
    }
}
