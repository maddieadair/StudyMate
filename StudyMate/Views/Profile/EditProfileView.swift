//
//  EditProfileView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct EditProfileView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var description: String = ""
    @State private var year: String = ""
    @State private var major: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                RoundedRectangle(cornerRadius: 80,
                                 style: .continuous)
                .aspectRatio(1.35, contentMode: .fill)
                .overlay(
                    Image("profilePic")
                        .resizable()
                        .scaledToFill()
                        .offset(x: -50.0, y: 20.0)
                )
                .frame(width: 300, height: 300, alignment: .leading)
                .clipShape(RoundedRectangle(cornerRadius: 80,
                                            style: .continuous))
                
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
                }
            }
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    EditProfileView()
}
