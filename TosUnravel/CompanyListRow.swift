//
//  CompanyListRow.swift
//  TosUnravel
//
//  Created by Ali Haroon on 4/13/22.
//

import SwiftUI

struct CompanyListRow: View {
    @EnvironmentObject var favoritesManager: Favorites
    private var isFavorite: Bool {
        favoritesManager.contains(companyName)
    }
    var companyName: String
    var body: some View {
        HStack{
            Image(companyName.lowercased())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(companyName)
            Spacer()
            Button {
                if favoritesManager.contains(companyName) {
                    favoritesManager.remove(companyName)
                } else {
                    favoritesManager.add(companyName)
                }
            } label: {
                if isFavorite == true {
                    Image(systemName:"star.fill")
                } else {
                    Image(systemName: "star")
                }
            }

        }
    }
}

struct CompanyListRow_Previews: PreviewProvider {
    static var previews: some View {
        CompanyListRow(companyName: "Test")
            .environmentObject(Favorites())
    }
}
