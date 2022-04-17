//
//  CompanyDecoder.swift
//  TosUnravel
//
//  Created by Ali Haroon on 3/23/22.
//

import Foundation
class CompanyDecoder {
    static func decodeCompany(company: String) -> Company? {
        if let path = Bundle.main.path(forResource: company.lowercased(), ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let decoder = JSONDecoder()
                
                let result = try decoder.decode(CompanyInfo.self, from: data)
                return Company(id: .init(), name: company, companyInfo: result)
            } catch let err {
                // handle error
                print(err)
                print(err.localizedDescription)
                return nil
            }
        }
        return nil
    }
}
