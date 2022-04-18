import Foundation

// MARK: - Service
struct Service: Codable {
    let error: Int?
    let message: String?
    let parameters: Parameters?
}
