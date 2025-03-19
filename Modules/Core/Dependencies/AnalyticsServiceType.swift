import Foundation

package protocol AnalyticsServiceType {
    func logEvent(_ name: String, parameters: [String: Any]?)
}
