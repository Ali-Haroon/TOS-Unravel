//
//  TosUnravelApp.swift
//  TosUnravel
//
//  Created by Ali Haroon on 1/11/22.
//

import SwiftUI

@main
struct TosUnravelApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(companies:[
                CompanyDecoder.decodeCompany(company: "Amazon")!,
                CompanyDecoder.decodeCompany(company: "Apple")!,
                CompanyDecoder.decodeCompany(company: "Cashapp")!,
                CompanyDecoder.decodeCompany(company: "Facebook")!,
                CompanyDecoder.decodeCompany(company: "Twitter")!,
                CompanyDecoder.decodeCompany(company: "Tiktok")!,
                CompanyDecoder.decodeCompany(company: "Spotify")!,
                CompanyDecoder.decodeCompany(company: "Snapchat")!,
                CompanyDecoder.decodeCompany(company: "Venmo")!,
                CompanyDecoder.decodeCompany(company: "Youtube")!


            ])
                .environmentObject(Favorites())
        }
    }
}
