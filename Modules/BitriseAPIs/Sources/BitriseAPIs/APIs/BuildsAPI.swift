//
// BuildsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(Combine)
import Combine
#endif
import Models

public final class BuildsAPI: BaseAPI {

    /**
     Abort a specific build
     
     - parameter appSlug: (path) App slug 
     - parameter buildSlug: (path) Build slug 
     - parameter buildAbortParams: (body) Build abort parameters 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: AnyPublisher<V0BuildAbortResponseModel, ErrorResponse>
     */
    #if canImport(Combine)
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func buildAbort(appSlug: String, buildSlug: String, buildAbortParams: V0BuildAbortParams, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue) -> AnyPublisher<V0BuildAbortResponseModel, ErrorResponse> {
        return Future<V0BuildAbortResponseModel, ErrorResponse> { [weak self] promise in
            self?.buildAbortWithRequestBuilder(appSlug: appSlug, buildSlug: buildSlug, buildAbortParams: buildAbortParams).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    promise(.success(response.body!))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    #endif

    /**
     Abort a specific build
     - POST /apps/{app-slug}/builds/{build-slug}/abort
     - Abort a specific build. Set an abort reason with the `abort_reason` parameter. Use the `abort_with_success` parameter to abort a build but still count it as a successful one.
     - API Key:
       - type: apiKey Bitrise-Addon-Auth-Token 
       - name: AddonAuthToken
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - parameter buildSlug: (path) Build slug 
     - parameter buildAbortParams: (body) Build abort parameters 
     - returns: RequestBuilder<V0BuildAbortResponseModel> 
     */
    private func buildAbortWithRequestBuilder(appSlug: String, buildSlug: String, buildAbortParams: V0BuildAbortParams) -> RequestBuilder<V0BuildAbortResponseModel> {
        var localVariablePath = "/apps/{app-slug}/builds/{build-slug}/abort"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let buildSlugPreEscape = "\(APIHelper.mapValueToPathItem(buildSlug))"
        let buildSlugPostEscape = buildSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{build-slug}", with: buildSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: buildAbortParams)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0BuildAbortResponseModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get the bitrise.yml of a build
     
     - parameter appSlug: (path) App slug 
     - parameter buildSlug: (path) Build slug 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: AnyPublisher<String, ErrorResponse>
     */
    #if canImport(Combine)
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func buildBitriseYmlShow(appSlug: String, buildSlug: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue) -> AnyPublisher<String, ErrorResponse> {
        return Future<String, ErrorResponse> { [weak self] promise in
            self?.buildBitriseYmlShowWithRequestBuilder(appSlug: appSlug, buildSlug: buildSlug).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    promise(.success(response.body!))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    #endif

    /**
     Get the bitrise.yml of a build
     - GET /apps/{app-slug}/builds/{build-slug}/bitrise.yml
     - Get the bitrise.yml file of one of the builds of a given app. This will return the `bitrise.yml` configuration with which the build ran. You can compare it to [the current bitrise.yml configuration](https://api-docs.bitrise.io/#/application/app-config-datastore-show) of the app.
     - API Key:
       - type: apiKey Bitrise-Addon-Auth-Token 
       - name: AddonAuthToken
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - parameter buildSlug: (path) Build slug 
     - returns: RequestBuilder<String> 
     */
    private func buildBitriseYmlShowWithRequestBuilder(appSlug: String, buildSlug: String) -> RequestBuilder<String> {
        var localVariablePath = "/apps/{app-slug}/builds/{build-slug}/bitrise.yml"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let buildSlugPreEscape = "\(APIHelper.mapValueToPathItem(buildSlug))"
        let buildSlugPostEscape = buildSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{build-slug}", with: buildSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<String>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     * enum for parameter sortBy
     */
    public enum SortBy_buildList: String, CaseIterable {
        case runningFirst = "running_first"
        case createdAt = "created_at"
    }

    /**
     List all builds of an app
     
     - parameter appSlug: (path) App slug 
     - parameter sortBy: (query) Order of builds: sort them based on when they were created or the time when they were triggered (optional)
     - parameter branch: (query) The branch which was built (optional)
     - parameter workflow: (query) The name of the workflow used for the build (optional)
     - parameter commitMessage: (query) The commit message of the build (optional)
     - parameter triggerEventType: (query) The event that triggered the build (push, pull-request, tag) (optional)
     - parameter pullRequestId: (query) The id of the pull request that triggered the build (optional)
     - parameter buildNumber: (query) The build number (optional)
     - parameter after: (query) List builds run after a given date (Unix Timestamp) (optional)
     - parameter before: (query) List builds run before a given date (Unix Timestamp) (optional)
     - parameter status: (query) The status of the build: not finished (0), successful (1), failed (2), aborted with failure (3), aborted with success (4) (optional)
     - parameter next: (query) Slug of the first build in the response (optional)
     - parameter limit: (query) Max number of elements per page (default: 50) (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: AnyPublisher<V0BuildListResponseModel, ErrorResponse>
     */
    #if canImport(Combine)
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func buildList(appSlug: String, sortBy: SortBy_buildList? = nil, branch: String? = nil, workflow: String? = nil, commitMessage: String? = nil, triggerEventType: String? = nil, pullRequestId: Int? = nil, buildNumber: Int? = nil, after: Date? = nil, before: Date? = nil, status: BuildResponseItemModel.Status? = nil, next: String? = nil, limit: Int? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue) -> AnyPublisher<V0BuildListResponseModel, ErrorResponse> {
        return Future<V0BuildListResponseModel, ErrorResponse> { [weak self] promise in
            self?.buildListWithRequestBuilder(appSlug: appSlug, sortBy: sortBy, branch: branch, workflow: workflow, commitMessage: commitMessage, triggerEventType: triggerEventType, pullRequestId: pullRequestId, buildNumber: buildNumber, after: after, before: before, status: status, next: next, limit: limit).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    promise(.success(response.body!))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    #endif

    /**
     List all builds of an app
     - GET /apps/{app-slug}/builds
     - List all the builds of a specified Bitrise app. Set parameters to filter builds: for example, you can search for builds run with a given workflow or all builds that were triggered by Pull Requests. It returns all the relevant data of the build.
     - API Key:
       - type: apiKey Bitrise-Addon-Auth-Token 
       - name: AddonAuthToken
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - parameter sortBy: (query) Order of builds: sort them based on when they were created or the time when they were triggered (optional)
     - parameter branch: (query) The branch which was built (optional)
     - parameter workflow: (query) The name of the workflow used for the build (optional)
     - parameter commitMessage: (query) The commit message of the build (optional)
     - parameter triggerEventType: (query) The event that triggered the build (push, pull-request, tag) (optional)
     - parameter pullRequestId: (query) The id of the pull request that triggered the build (optional)
     - parameter buildNumber: (query) The build number (optional)
     - parameter after: (query) List builds run after a given date (Unix Timestamp) (optional)
     - parameter before: (query) List builds run before a given date (Unix Timestamp) (optional)
     - parameter status: (query) The status of the build: not finished (0), successful (1), failed (2), aborted with failure (3), aborted with success (4) (optional)
     - parameter next: (query) Slug of the first build in the response (optional)
     - parameter limit: (query) Max number of elements per page (default: 50) (optional)
     - returns: RequestBuilder<V0BuildListResponseModel> 
     */
    private func buildListWithRequestBuilder(appSlug: String, sortBy: SortBy_buildList? = nil, branch: String? = nil, workflow: String? = nil, commitMessage: String? = nil, triggerEventType: String? = nil, pullRequestId: Int? = nil, buildNumber: Int? = nil, after: Date? = nil, before: Date? = nil, status: BuildResponseItemModel.Status? = nil, next: String? = nil, limit: Int? = nil) -> RequestBuilder<V0BuildListResponseModel> {
        var localVariablePath = "/apps/{app-slug}/builds"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "sort_by": sortBy?.encodeToJSON(),
            "branch": branch?.encodeToJSON(),
            "workflow": workflow?.encodeToJSON(),
            "commit_message": commitMessage?.encodeToJSON(),
            "trigger_event_type": triggerEventType?.encodeToJSON(),
            "pull_request_id": pullRequestId?.encodeToJSON(),
            "build_number": buildNumber?.encodeToJSON(),
            "after": after?.encodeToJSONAsInt(),
            "before": before?.encodeToJSONAsInt(),
            "status": status?.rawValue.encodeToJSON(),
            "next": next?.encodeToJSON(),
            "limit": limit?.encodeToJSON()
        ])

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0BuildListResponseModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     List all builds
     
     - parameter ownerSlug: (query) The slug of the owner of the app or apps (optional)
     - parameter isOnHold: (query) Indicates whether the build has started yet (true: the build hasn&#39;t started) (optional)
     - parameter status: (query) The status of the build: not finished (0), successful (1), failed (2), aborted with failure (3), aborted with success (4) (optional)
     - parameter next: (query) Slug of the first build in the response (optional)
     - parameter limit: (query) Max number of elements per page (default: 50) (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: AnyPublisher<V0BuildListAllResponseModel, ErrorResponse>
     */
    #if canImport(Combine)
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func buildListAll(ownerSlug: String? = nil, isOnHold: Bool? = nil, status: Int? = nil, next: String? = nil, limit: Int? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue) -> AnyPublisher<V0BuildListResponseModel, ErrorResponse> {
        return Future<V0BuildListResponseModel, ErrorResponse> { [weak self] promise in
            self?.buildListAllWithRequestBuilder(ownerSlug: ownerSlug, isOnHold: isOnHold, status: status, next: next, limit: limit).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    promise(.success(response.body!))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    #endif

    /**
     List all builds
     - GET /builds
     - List all the Bitrise builds that can be accessed with the authenticated account. Filter builds based on their owner, using the owner slug, or the status of the build.
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter ownerSlug: (query) The slug of the owner of the app or apps (optional)
     - parameter isOnHold: (query) Indicates whether the build has started yet (true: the build hasn&#39;t started) (optional)
     - parameter status: (query) The status of the build: not finished (0), successful (1), failed (2), aborted with failure (3), aborted with success (4) (optional)
     - parameter next: (query) Slug of the first build in the response (optional)
     - parameter limit: (query) Max number of elements per page (default: 50) (optional)
     - returns: RequestBuilder<V0BuildListAllResponseModel> 
     */
    private func buildListAllWithRequestBuilder(ownerSlug: String? = nil, isOnHold: Bool? = nil, status: Int? = nil, next: String? = nil, limit: Int? = nil) -> RequestBuilder<V0BuildListResponseModel> {
        let localVariablePath = "/builds"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "owner_slug": ownerSlug?.encodeToJSON(),
            "is_on_hold": isOnHold?.encodeToJSON(),
            "status": status?.encodeToJSON(),
            "next": next?.encodeToJSON(),
            "limit": limit?.encodeToJSON()
        ])

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0BuildListResponseModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get the build log of a build
     
     - parameter appSlug: (path) App slug 
     - parameter buildSlug: (path) Build slug 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: AnyPublisher<Void, ErrorResponse>
     */
    #if canImport(Combine)
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func buildLog(appSlug: String, buildSlug: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, timestamp: String? = nil) -> AnyPublisher<BuildLogResponseModel, ErrorResponse> {
        return Future<BuildLogResponseModel, ErrorResponse> { [weak self] promise in
            self?.buildLogWithRequestBuilder(appSlug: appSlug, buildSlug: buildSlug, timestamp: timestamp).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    promise(.success(response.body!))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    #endif

    /**
     Get the build log of a build
     - GET /apps/{app-slug}/builds/{build-slug}/log
     - Get the build log of a specified build of a Bitrise app. You can get the build slug either by calling the [/builds](https://api-docs.bitrise.io/#/builds/build-list) endpoint or by clicking on the build on bitrise.io and copying the slug from the URL.
     - API Key:
       - type: apiKey Bitrise-Addon-Auth-Token 
       - name: AddonAuthToken
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - parameter buildSlug: (path) Build slug 
     - returns: RequestBuilder<Void> 
     */
    private func buildLogWithRequestBuilder(appSlug: String, buildSlug: String, timestamp: String? = nil) -> RequestBuilder<BuildLogResponseModel> {
        var localVariablePath = "/apps/{app-slug}/builds/{build-slug}/log"
        if let timestamp = timestamp {
            localVariablePath.append("?after_timestamp=\(timestamp)&timestamp=\(timestamp)")
        }
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let buildSlugPreEscape = "\(APIHelper.mapValueToPathItem(buildSlug))"
        let buildSlugPostEscape = buildSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{build-slug}", with: buildSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<BuildLogResponseModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Get a build of a given app
     
     - parameter appSlug: (path) App slug 
     - parameter buildSlug: (path) Build slug 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: AnyPublisher<V0BuildShowResponseModel, ErrorResponse>
     */
    #if canImport(Combine)
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func buildShow(appSlug: String, buildSlug: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue) -> AnyPublisher<V0BuildShowResponseModel, ErrorResponse> {
        return Future<V0BuildShowResponseModel, ErrorResponse> { [weak self] promise in
            self?.buildShowWithRequestBuilder(appSlug: appSlug, buildSlug: buildSlug).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    promise(.success(response.body!))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    #endif

    /**
     Get a build of a given app
     - GET /apps/{app-slug}/builds/{build-slug}
     - Get the specified build of a given Bitrise app. You need to provide both an app slug and a build slug. You can get the build slug either by calling the [/builds](https://api-docs.bitrise.io/#/builds/build-list) endpoint or by clicking on the build on bitrise.io and copying the slug from the URL. The endpoint returns all the relevant data of the build.
     - API Key:
       - type: apiKey Bitrise-Addon-Auth-Token 
       - name: AddonAuthToken
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - parameter buildSlug: (path) Build slug 
     - returns: RequestBuilder<V0BuildShowResponseModel> 
     */
    private func buildShowWithRequestBuilder(appSlug: String, buildSlug: String) -> RequestBuilder<V0BuildShowResponseModel> {
        var localVariablePath = "/apps/{app-slug}/builds/{build-slug}"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let buildSlugPreEscape = "\(APIHelper.mapValueToPathItem(buildSlug))"
        let buildSlugPostEscape = buildSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{build-slug}", with: buildSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0BuildShowResponseModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Trigger a new build
     
     - parameter appSlug: (path) App slug 
     - parameter buildParams: (body) Build trigger parameters 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: AnyPublisher<V0BuildTriggerRespModel, ErrorResponse>
     */
    #if canImport(Combine)
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func buildTrigger(appSlug: String, buildParams: BuildTriggerParams, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue) -> AnyPublisher<V0BuildTriggerRespModel, ErrorResponse> {
        return Future<V0BuildTriggerRespModel, ErrorResponse> { [weak self] promise in
            self?.buildTriggerWithRequestBuilder(appSlug: appSlug, buildParams: buildParams).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    promise(.success(response.body!))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    #endif

    /**
     Trigger a new build
     - POST /apps/{app-slug}/builds
     - Trigger a new build. Specify an app slug and at least one parameter out of three: a git tag or git commit hash, a branch, or a workflow ID. You can also set specific parameters for Pull Request builds and define additional environment variables for your build. [Check out our detailed guide](https://devcenter.bitrise.io/api/build-trigger/).
     - API Key:
       - type: apiKey Bitrise-Addon-Auth-Token 
       - name: AddonAuthToken
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - parameter buildParams: (body) Build trigger parameters 
     - returns: RequestBuilder<V0BuildTriggerRespModel> 
     */
    private func buildTriggerWithRequestBuilder(appSlug: String, buildParams: BuildTriggerParams) -> RequestBuilder<V0BuildTriggerRespModel> {
        var localVariablePath = "/apps/{app-slug}/builds"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: buildParams)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0BuildTriggerRespModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     List the workflows of an app
     
     - parameter appSlug: (path) App slug 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: AnyPublisher<V0BuildWorkflowListResponseModel, ErrorResponse>
     */
    #if canImport(Combine)
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func buildWorkflowList(appSlug: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue) -> AnyPublisher<V0BuildWorkflowListResponseModel, ErrorResponse> {
        return Future<V0BuildWorkflowListResponseModel, ErrorResponse> { [weak self] promise in
            self?.buildWorkflowListWithRequestBuilder(appSlug: appSlug).execute(apiResponseQueue) { result in
                switch result {
                case let .success(response):
                    promise(.success(response.body!))
                case let .failure(error):
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    #endif

    /**
     List the workflows of an app
     - GET /apps/{app-slug}/build-workflows
     - List the workflows that were triggered at any time for a given Bitrise app. Note that it might list workflows that are currently not defined in the app's `bitrise.yml` configuration - and conversely, workflows that were never triggered will not be listed even if they are defined in the `bitrise.yml` file.
     - API Key:
       - type: apiKey Bitrise-Addon-Auth-Token 
       - name: AddonAuthToken
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - returns: RequestBuilder<V0BuildWorkflowListResponseModel> 
     */
    private func buildWorkflowListWithRequestBuilder(appSlug: String) -> RequestBuilder<V0BuildWorkflowListResponseModel> {
        var localVariablePath = "/apps/{app-slug}/build-workflows"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0BuildWorkflowListResponseModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
