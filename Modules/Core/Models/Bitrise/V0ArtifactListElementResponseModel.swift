//
// V0ArtifactListElementResponseModel.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct V0ArtifactListElementResponseModel: Codable, Identifiable, Sendable {
    public var id: String {
        return slug
    }

    public let artifactMeta: [Int]?
    public let artifactType: String?
    public let fileSizeBytes: Int?
    public let isPublicPageEnabled: Bool?
    // swiftlint:disable:next implicitly_unwrapped_optional
    public let slug: String!
    public let title: String?

    public init(artifactMeta: [Int]? = nil, artifactType: String? = nil, fileSizeBytes: Int? = nil, isPublicPageEnabled: Bool? = nil, slug: String = "", title: String? = nil) {
        self.artifactMeta = artifactMeta
        self.artifactType = artifactType
        self.fileSizeBytes = fileSizeBytes
        self.isPublicPageEnabled = isPublicPageEnabled
        self.slug = slug
        self.title = title
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case artifactMeta = "artifact_meta"
        case artifactType = "artifact_type"
        case fileSizeBytes = "file_size_bytes"
        case isPublicPageEnabled = "is_public_page_enabled"
        case slug
        case title
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(artifactMeta, forKey: .artifactMeta)
        try container.encodeIfPresent(artifactType, forKey: .artifactType)
        try container.encodeIfPresent(fileSizeBytes, forKey: .fileSizeBytes)
        try container.encodeIfPresent(isPublicPageEnabled, forKey: .isPublicPageEnabled)
        try container.encodeIfPresent(slug, forKey: .slug)
        try container.encodeIfPresent(title, forKey: .title)
    }
}
