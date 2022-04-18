//
//  API.swift
//  TosUnravel
//
//  Created by Ali Haroon on 4/16/22.
//

import Foundation
import Combine
enum NetworkState{
    case loading
    case loaded
    case failed
}
struct NetworkHandler{
    static func getServices() async throws -> Service {
        let urlString = "https://api.tosdr.org/service/v1/"
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        
        return try decoder.decode(Service.self, from: data)
    }
    static func getService(serviceName: String) async throws -> ServiceInfo {
        let urlString = "https://api.tosdr.org/service/v1/"
//        let url = URL(string: urlString)!
        var components = URLComponents(string: urlString)!
        let queryItem = URLQueryItem(name: "service", value: serviceName)
        components.queryItems = [queryItem]
        guard let url = components.url else {
            throw NSError(domain: "Bad URL", code: 1, userInfo: nil)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        
        return try decoder.decode(ServiceInfo.self, from: data)
    }
}
