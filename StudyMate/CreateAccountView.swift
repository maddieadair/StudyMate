//
//  CreateAccountView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/14/24.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 15) {
                Text("Create an account")
                    .font(.custom("AveriaGruesaLibre-Regular", size: 36))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Welcome! To get started, please enter your details.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.medium)
                    .tracking(0.5)
                
            }
            Spacer()
            
            VStack(spacing: 20) {
                TextField("First Name", text: $firstName)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray)
                    )
                TextField("Last Name", text: $lastName)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray)
                    )
                TextField("Username", text: $username)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray)
                    )
                TextField("Email", text: $email)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray)
                    )
                TextField("Password", text: $password)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray)
                    )
                TextField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray)
                    )
            }
            
            Spacer()
            
            Button(action: {
                print("Sign Up")
            }) {
                Text("Sign Up")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.customBlue)
                    .foregroundStyle(.customPink)
                    .clipShape(.capsule)
            }
            
            Spacer()
            
        }
        .frame(maxWidth: 325)
        
    }
}

#Preview {
    CreateAccountView()
}
