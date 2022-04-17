import SwiftUI

struct ContentView: View {
    @State var companies: [Company]
    @State var searchString: String = ""
    @State var filterFavorites: Bool = false
    @State var filterLength: Bool = false
    @EnvironmentObject var favorites: Favorites
    @State var isPresentingAboutPage: Bool = false
    var body: some View {
        NavigationView {
            List(filteredCompanies(companies: companies)) { company in
                NavigationLink.init {
                    CompanyRow(company: company)
                } label: {
                    CompanyListRow(companyName: company.name)
                        .environmentObject(favorites)
                        .buttonStyle(.plain)
                        .padding(8)
                }
                
            }
            .sheet(isPresented: $isPresentingAboutPage, onDismiss: {
                self.isPresentingAboutPage = false
            }, content: {ProfileView(shouldShow: $isPresentingAboutPage)})
            .searchable(text: $searchString)
            
            .navigationTitle("TOS Unravel")
            
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Menu(content: {
                        Button("Sort by Favorites") {
                            withAnimation {
                                filterFavorites.toggle()
                            }
                        }
                        Button("Sort by length") {
                            withAnimation {
                                filterLength.toggle()
                            }
                        }
                    }, label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    })
                    
                })
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button {
                        isPresentingAboutPage = true
                    } label: {
                        Image(systemName: "info.circle")
                    }

                })
            })

        }
        
        .onAppear {
            print(CompanyDecoder.decodeCompany(company: "amazon") != nil)
            print(CompanyDecoder.decodeCompany(company: "apple") != nil)
            print(CompanyDecoder.decodeCompany(company: "cashapp") != nil)
            print(CompanyDecoder.decodeCompany(company: "facebook") != nil)
            print(CompanyDecoder.decodeCompany(company: "tiktok") != nil)
            print(CompanyDecoder.decodeCompany(company: "youtube") != nil)
            print(CompanyDecoder.decodeCompany(company: "spotify") != nil)
            print(CompanyDecoder.decodeCompany(company: "snapchat") != nil)
            print(CompanyDecoder.decodeCompany(company: "venmo") != nil)
            
    
        }
        
    }
    func filteredCompanies(companies: [Company]) -> [Company] {
        var newCompanies: [Company] = companies
            .lazy
            .filter({
                if searchString != "" {
                    return $0.name.uppercased().contains(searchString.uppercased())
                }
                return true
            })
            .filter({ company in
                if filterFavorites {
                    return favorites.contains(company.name)
                }
                return true
            })
        
        if filterLength {
            
            newCompanies.sort { lhs, rhs in
                lhs.companyInfo.pointsData.values.count <= rhs.companyInfo.pointsData.values.count
            }
        }
        return newCompanies
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(companies: [
            CompanyDecoder.decodeCompany(company: "amazon")!,
            CompanyDecoder.decodeCompany(company: "apple")!,
            CompanyDecoder.decodeCompany(company: "cashapp")!,
            CompanyDecoder.decodeCompany(company: "facebook")!,
            CompanyDecoder.decodeCompany(company: "twitter")!,
            CompanyDecoder.decodeCompany(company: "tiktok")!,
            CompanyDecoder.decodeCompany(company: "spotify")!,
            CompanyDecoder.decodeCompany(company: "snapchat")!,
            CompanyDecoder.decodeCompany(company: "venmo")!,
            CompanyDecoder.decodeCompany(company: "youtube")!
        ])
.previewInterfaceOrientation(.portrait)
    }
}
