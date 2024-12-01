//
// AddonsSetupGuide.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct AddonsSetupGuide: Codable {

    public let instructions: [AddonsSetupInstruction]?
    public let notification: String?

    public init(instructions: [AddonsSetupInstruction]? = nil, notification: String? = nil) {
        self.instructions = instructions
        self.notification = notification
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case instructions
        case notification
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(instructions, forKey: .instructions)
        try container.encodeIfPresent(notification, forKey: .notification)
    }
}
