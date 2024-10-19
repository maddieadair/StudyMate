//
//  ForgotPasswordView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/14/24.
//

import SwiftUI

struct PasswordPath: View {
    var body: some View {
        Path { path in
            //Top left
            path.move(to: CGPoint(x: 0, y: 0))
            //Left vertical bound
            path.addLine(to: CGPoint(x: 0, y: 475))
            //Curve
            path.addCurve(to: CGPoint(x: 450, y: 420), control1: CGPoint(x: 200, y: 375), control2: CGPoint(x: 250, y: 620))
            //Right vertical bound
            path.addLine(to: CGPoint(x: 500, y: 0))
        }
        .fill(.customPink)
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct ForgotPasswordView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            PasswordPath()
            VStack {
                Spacer()
                    .frame(height: 10)

                VStack(spacing: 30) {
                    Text("Forgot your password?")
                        .font(.custom("AveriaGruesaLibre-Regular", size: 48))
                        .foregroundStyle(.customBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 30)
                    Text("No worries! Just enter the email address associated with your account and we’ll send you a link to reset you password.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.medium)
                        .tracking(0.5)
                }

                
                
                Spacer()
                    .frame(height: 250)
                
                
                VStack(spacing: 50) {
                    TextField("Email", text: $username)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray)
                        )
                    
                    Button(action: {
                        print("Submit")
                    }) {
                        Text("Submit")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.customBlue)
                            .foregroundStyle(.customPink)
                            .clipShape(.capsule)
                    }
                    
                }
                Spacer()
            }
            .frame(maxWidth: 325)
        }
    }
}

#Preview {
    ForgotPasswordView()
}
