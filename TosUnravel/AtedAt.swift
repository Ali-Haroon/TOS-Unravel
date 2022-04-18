import Foundation

// MARK: - AtedAt
struct AtedAt: Codable {
    let timezone: Timezone?
    let pgsql: String?
    let unix: Int?
}
