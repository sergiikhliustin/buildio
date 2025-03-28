//
// AppSetupAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import Models

package final class AppSetupAPI: BaseAPI {

    /**
     Upload a new bitrise.yml for your application.
     
     - parameter appSlug: (path) App slug 
     - parameter appConfig: (body) App config parameters 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: [String: String]
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    package func appConfigCreate(appSlug: String, appConfig: V0AppConfigRequestParam) async throws -> [String: String] {
        return try await appConfigCreateWithRequestBuilder(appSlug: appSlug, appConfig: appConfig).execute().body
    }

    /**
     Upload a new bitrise.yml for your application.
     - POST /apps/{app-slug}/bitrise.yml
     - Upload a new bitrise.yml for your application.
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - parameter appConfig: (body) App config parameters 
     - returns: RequestBuilder<[String: String]> 
     */
    private func appConfigCreateWithRequestBuilder(appSlug: String, appConfig: V0AppConfigRequestParam) -> RequestBuilder<[String: String]> {
        var localVariablePath = "/apps/{app-slug}/bitrise.yml"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: appConfig)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[String: String]>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Add a new app
     
     - parameter app: (body) App parameters 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: V0AppRespModel
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    package func appCreate(app: V0AppUploadParams) async throws -> V0AppRespModel {
        return try await appCreateWithRequestBuilder(app: app).execute().body
    }

    /**
     Add a new app
     - POST /apps/register
     - Add a new app to Bitrise. This is the first step of the app registration process. To successfully set it up, you need to provide the required app parameters: your git provider, the repository URL, the slug of the repository as it appears at the provider, and the slug of the owner of the repository. Read more about the app creation process in our [detailed guide](https://devcenter.bitrise.io/api/adding-and-managing-apps/#adding-a-new-app).
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter app: (body) App parameters 
     - returns: RequestBuilder<V0AppRespModel> 
     */
    private func appCreateWithRequestBuilder(app: V0AppUploadParams) -> RequestBuilder<V0AppRespModel> {
        let localVariablePath = "/apps/register"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: app)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0AppRespModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Save the application at the end of the app registration process
     
     - parameter appSlug: (path) App slug 
     - parameter app: (body) App finish parameters 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: V0AppFinishRespModel
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    package func appFinish(appSlug: String, app: V0AppFinishParams) async throws -> V0AppFinishRespModel {
        return try await appFinishWithRequestBuilder(appSlug: appSlug, app: app).execute().body
    }

    /**
     Save the application at the end of the app registration process
     - POST /apps/{app-slug}/finish
     - Save the application after registering it on Bitrise and registering an SSH key (and, optionally, adding a webhook). With this endpoint you can define the initial configuration, define application-level environment variables, determine the project type, and set an Organization to be the owner of the app. Read more about the app registration process in our [detailed guide](https://devcenter.bitrise.io/api/adding-and-managing-apps/#adding-a-new-app).
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - parameter app: (body) App finish parameters 
     - returns: RequestBuilder<V0AppFinishRespModel> 
     */
    private func appFinishWithRequestBuilder(appSlug: String, app: V0AppFinishParams) -> RequestBuilder<V0AppFinishRespModel> {
        var localVariablePath = "/apps/{app-slug}/finish"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: app)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0AppFinishRespModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Register an incoming webhook for a specific application
     
     - parameter appSlug: (path) App slug 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: V0WebhookRespModel
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    package func appWebhookCreate(appSlug: String) async throws -> V0WebhookRespModel {
        return try await appWebhookCreateWithRequestBuilder(appSlug: appSlug).execute().body
    }

    /**
     Register an incoming webhook for a specific application
     - POST /apps/{app-slug}/register-webhook
     - [Register an incoming webhook](https://devcenter.bitrise.io/api/incoming-and-outgoing-webhooks/#incoming-webhooks) for a specific application. You can do this during the app registration process or at any other time in an app's life. When calling this endpoint, a webhook is registered at your git provider: this is necessary to automatically trigger builds on Bitrise.
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - returns: RequestBuilder<V0WebhookRespModel> 
     */
    private func appWebhookCreateWithRequestBuilder(appSlug: String) -> RequestBuilder<V0WebhookRespModel> {
        var localVariablePath = "/apps/{app-slug}/register-webhook"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0WebhookRespModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }

    /**
     Add an SSH-key to a specific app
     
     - parameter appSlug: (path) App slug 
     - parameter sshKey: (body) SSH key parameters 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: V0SSHKeyRespModel
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    package func sshKeyCreate(appSlug: String, sshKey: V0SSHKeyUploadParams) async throws -> V0SSHKeyRespModel {
        return try await sshKeyCreateWithRequestBuilder(appSlug: appSlug, sshKey: sshKey).execute().body
    }

    /**
     Add an SSH-key to a specific app
     - POST /apps/{app-slug}/register-ssh-key
     - Add an SSH-key to a specific app. After creating an app, you need to register the SSH key so that Bitrise will be able to access and clone your repository during the build process. This requires the app slug of your newly created app.
     - API Key:
       - type: apiKey Authorization 
       - name: PersonalAccessToken
     - parameter appSlug: (path) App slug 
     - parameter sshKey: (body) SSH key parameters 
     - returns: RequestBuilder<V0SSHKeyRespModel> 
     */
    private func sshKeyCreateWithRequestBuilder(appSlug: String, sshKey: V0SSHKeyUploadParams) -> RequestBuilder<V0SSHKeyRespModel> {
        var localVariablePath = "/apps/{app-slug}/register-ssh-key"
        let appSlugPreEscape = "\(APIHelper.mapValueToPathItem(appSlug))"
        let appSlugPostEscape = appSlugPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{app-slug}", with: appSlugPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: sshKey)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = authorizationHeaders()

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<V0SSHKeyRespModel>.Type = requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}
