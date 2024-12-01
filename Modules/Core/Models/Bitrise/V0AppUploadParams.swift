//
// V0AppUploadParams.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct V0AppUploadParams: Codable {

    /** The slug of the owner of the repository at the git provider */
    public let gitOwner: String
    /** The slug of the repository at the git provider */
    public let gitRepoSlug: String
    /** If `true` then the repository visibility setting will be public, in case of `false` it will be private */
    public let isPublic: Bool
    /** The git provider you are using, it can be `github`, `bitbucket`, `gitlab`, `gitlab-self-hosted` or `custom` */
    public let provider: String
    /** The URL of your repository */
    public let repoUrl: String
    /** It has to be provided by legacy reasons and has to have the `git` value */
    public let type: String

    public init(gitOwner: String, gitRepoSlug: String, isPublic: Bool, provider: String, repoUrl: String, type: String) {
        self.gitOwner = gitOwner
        self.gitRepoSlug = gitRepoSlug
        self.isPublic = isPublic
        self.provider = provider
        self.repoUrl = repoUrl
        self.type = type
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case gitOwner = "git_owner"
        case gitRepoSlug = "git_repo_slug"
        case isPublic = "is_public"
        case provider
        case repoUrl = "repo_url"
        case type
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gitOwner, forKey: .gitOwner)
        try container.encode(gitRepoSlug, forKey: .gitRepoSlug)
        try container.encode(isPublic, forKey: .isPublic)
        try container.encode(provider, forKey: .provider)
        try container.encode(repoUrl, forKey: .repoUrl)
        try container.encode(type, forKey: .type)
    }
}
