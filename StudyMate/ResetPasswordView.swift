//
//  ResetPasswordView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/14/24.
//

import SwiftUI

struct ResetPasswordPath: View {
    var body: some View {
        Path { path in
            //Top left
            path.move(to: CGPoint(x: 0, y: 0))
            //Left vertical bound
            path.addLine(to: CGPoint(x: 0, y: 450))
            //Curve
            path.addCurve(to: CGPoint(x: 450, y: 400), control1: CGPoint(x: 200, y: 330), control2: CGPoint(x: 250, y: 600))
            //Right vertical bound
            path.addLine(to: CGPoint(x: 500, y: 0))
        }
        .fill(.customPink)
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct ResetPasswordView: View {
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ResetPasswordPath()
            VStack {
                Spacer()
                    .frame(height: 30)
                
                VStack(spacing: 40) {
                    Text("Reset Password")
                        .font(.custom("AveriaGruesaLibre-Regular", size: 48))
                        .foregroundStyle(.customBlue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 30)
                    Text("Enter a new password below to change your password.")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.medium)
                        .tracking(0.5)
                }
                
                
                
                Spacer()
                    .frame(height: 250)
                
                
                VStack(spacing: 50) {
                    VStack(spacing: 15) {
                        TextField("New Password", text: $newPassword)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray)
                            )
                        TextField("Confirm New Password", text: $confirmPassword)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.gray)
                            )
                    }
                    
                    
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
    ResetPasswordView()
}
