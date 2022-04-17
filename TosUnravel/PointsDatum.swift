// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pointsDatum = try? newJSONDecoder().decode(PointsDatum.self, from: jsonData)

import Foundation

// MARK: - PointsDatum
struct PointsDatum: Codable, Hashable, Identifiable {
    let approved: Bool?
    let id: String
    let needModeration: Bool?
    let quoteDoc: String?
    let quoteEnd, quoteStart: Int?
    let quoteText: String?
    let services: [String]
    let slug, submittedBy: String?
    let title: String
    let topics: [String]
    let tosdr: Tosdr
    let discussion: String?
    let pointsDatumSet: String?
    
    enum CodingKeys: String, CodingKey {
        case approved, id, needModeration, quoteDoc, quoteEnd, quoteStart, quoteText, services, slug, submittedBy, title, topics, tosdr, discussion
        case pointsDatumSet = "set"
    }
}
