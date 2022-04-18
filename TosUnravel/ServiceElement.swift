import Foundation

// MARK: - ServiceElement
struct ServiceElement: Codable {
    let id: Int?
    let isComprehensivelyReviewed: Bool?
    let urls: [String]?
    let name: String?
    let status: String?
    let updatedAt, createdAt: AtedAt?
    let slug: String?
    let wikipedia: String?
    let rating: Rating?
    let links: Links?
}
