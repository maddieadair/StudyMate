//
//  SelectYearView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct MoreDetailsView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var yearSelection = "Select"
    let years = ["Select", "Freshman", "Sophomore", "Junior", "Senior", "Graduate Student", "Other"]
    
    @State private var majorSelection = majors[0]

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            
            VStack(spacing: 15) {
                Text("More details")
                    .font(.custom("AveriaGruesaLibre-Regular", size: 36))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("To better cater suggestions for youu, please select your current year and major.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.medium)
                    .tracking(0.5)
                
            }
            
            Spacer()
            
            VStack(spacing: 20) {
                
                HStack {
                    Text("Year")
                    Spacer()
                    Picker("Appearance", selection: $yearSelection)
                    {
                        ForEach(years, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray)
                )
                
                
                HStack {
                    Text("Major")
                    Spacer()
                    Picker("Major", selection: $majorSelection)
                    {
                        ForEach(majors, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray)
                )

            }
            
            Spacer()
            
            
            NavigationLink(destination: MainView().navigationBarBackButtonHidden(true)) {
                Text("Complete Sign Up")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.customBlue)
                    .foregroundStyle(.customPink)
                    .clipShape(.capsule)
            }
            .frame(alignment: .bottom)
            
            
        }
        .frame(maxWidth: 325)
        
    }
}

#Preview {
    MoreDetailsView()
}
