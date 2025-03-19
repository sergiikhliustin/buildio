import Foundation
import FirebaseCore
import FirebaseAnalytics
import Dependencies

package final class AnalyticsService: AnalyticsServiceType {
    package init() {
    }

    package func logEvent(_ name: String, parameters: [String: Any]?) {
        guard FirebaseApp.app() != nil else {
            return
        }
        Analytics.logEvent(name, parameters: parameters)
    }
}
