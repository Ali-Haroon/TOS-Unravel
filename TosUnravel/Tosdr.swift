// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tosdr = try? newJSONDecoder().decode(Tosdr.self, from: jsonData)

import Foundation

// MARK: - Tosdr
struct Tosdr: Codable, Hashable {
    let binding: Bool
    let tosdrCase: String
    let point: Point
    let score: Int?
    let privacyRelated: Bool?
    let sources: [String]?

    enum CodingKeys: String, CodingKey {
        case binding
        case tosdrCase = "case"
        case point, privacyRelated, sources
        case score
    }
}
