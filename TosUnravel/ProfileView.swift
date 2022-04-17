//
//  ProfileView.swift
//  TosUnravel
//
//  Created by Ali Haroon on 4/13/22.
//

import SwiftUI

struct ProfileView: View {
    @Binding var shouldShow: Bool
    var body: some View {
        NavigationView{
            VStack (alignment: .center){
                Image("Ali")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(75)
                HStack {
                    Spacer()
                }
                Button("Website") {
                    if let url = URL(string: "https://tosunravel.weebly.com") {
                        UIApplication.shared.open(url)
                    }}
                Button("Github"){
                    if let url = URL(string:"https://tosunravel.weebly.com/github.html"){
                        UIApplication.shared.open(url)
                    }}
                .padding([.top,.bottom])
                Button("Privacy Policy"){
                    if let url = URL(string:"https://tosunravel.weebly.com/privacy-policy.html"){
                        UIApplication.shared.open(url)
                    }}
                Spacer()
            }//vstack
            .navigationTitle("About Us")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        shouldShow = false
                    } label: {
                        Text("Dismiss")
                    }
                    
                }
            }
        }
    }}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(shouldShow: .constant(false))
    }
}
