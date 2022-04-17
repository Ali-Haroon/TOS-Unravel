// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let CompanyInfo = try? newJSONDecoder().decode(CompanyInfo.self, from: jsonData)

import Foundation

// MARK: - CompanyInfo
struct CompanyInfo: Codable, Hashable {
    let alexa: Int
    let welcomeClass: String
    let links: [String: Link]
    let pointsData: [String: PointsDatum]
    let urls: [String]

    enum CodingKeys: String, CodingKey {
        case alexa
        case welcomeClass = "class"
        case links, pointsData, urls
    }
}
