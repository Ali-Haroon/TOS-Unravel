//
//  ServicePage.swift
//  TosUnravel
//
//  Created by Ali Haroon on 4/17/22.
//

import SwiftUI

import SwiftUI

struct ServicePage: View {
    //let termsofServices = try! JSONDecoder().decode(TOSList.self, from: data)
    @State var company: Company
    var pointsData: [PointsDatum] {
        return company.companyInfo.pointsData.values
            .map { data in
                return data
            }
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Shortened Terms")
                        .font(.headline)
                    Spacer()
                }
                ForEach(pointsData.indices) { index in
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Text("#\(index + 1) - ")
                                .foregroundColor(.secondary)
                            Text("\(pointsData[index].title)")
                        }
                        .padding()
                        HStack {
                            Spacer()
                            if let score = pointsData[index].tosdr.score {
                                ScoreView(score: score)
                            }
                            Spacer()
                        }
                    }
                }
                Section(content: {
                    
                    ForEach(pointsData.indices) { index in
                        if let discussion = pointsData[index].discussion {
                            
                            Button.init(discussion) {}
                        }
                    }
                }, header: {
                    Text("Sources")
                        .font(.headline)
                })
                .padding()

            }
        }
        .padding()
        .navigationTitle(company.name)

    }
}

struct ServicePage_Previews: PreviewProvider {
    static var previews: some View {
        ServicePage(company: CompanyDecoder.decodeCompany(company: "apple")!)
    }
}
