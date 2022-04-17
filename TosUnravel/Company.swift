import Foundation
import UIKit
struct Company: Hashable, Codable, Identifiable {
    var id: UUID
    var name: String
    var companyInfo: CompanyInfo
}
