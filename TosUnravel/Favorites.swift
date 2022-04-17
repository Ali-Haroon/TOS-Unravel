//
//  File.swift
//  TosUnravel
//
//  Created by Ali Haroon on 4/10/22.
//

import Foundation
import SwiftUI

class Favorites: ObservableObject, Equatable {
    private var companies: Set<String>
    
    private let saveKey = "Favorites"
    
    init() {
        let array = UserDefaults.standard.stringArray(forKey: saveKey)
        
        var companySet = Set<String>()
        array?.forEach({ company in
            companySet.insert(company)
        })
        print(companySet)
        companies = companySet
    }
    func contains(_ companyName: String) -> Bool {
        return companies.contains(companyName)
    }
    func add(_ favorite: String) {
        objectWillChange.send()
        companies.insert(favorite)
        save()
    }
    func remove(_ favorite: String) {
        objectWillChange.send()
        companies.remove(favorite)
        save()
    }
    func save() {
        let stringArray = Array(companies)
        print(stringArray)
        UserDefaults.standard.set(stringArray, forKey: saveKey)
    }
    static func ==(lhs: Favorites, rhs: Favorites) -> Bool{
        return false
        return lhs.companies == rhs.companies
    }
}
