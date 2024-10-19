//
//  ProfileView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct ProfileView: View {
    
    var name: String
    var username: String
    var major: String
    var year: String
    var description: String
    
    var body: some View {
            ScrollView {
                VStack(spacing: 30) {
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
                        VStack {
                            Text(name)
                                .font(.custom("AveriaGruesaLibre-Regular", size: 40))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("@\(username)")
                                .font(.system(size: 20, weight: .semibold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        VStack(spacing: 30) {
                            Text("\(major) - \(year)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.medium)
                            
                            Text(description)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.medium)
                        }
                        
                    }
                    .padding(.horizontal, 25)
                    
                    VStack(spacing: 10) {
                        HStack {
                            VStack(spacing: 15) {
                                Text("Edit Profile")
                                    .fontWeight(.semibold)
                                
                                NavigationLink(destination: EditProfileView().toolbar(.hidden, for: .tabBar)) {
                                    Image(systemName: "arrow.up.forward")
                                        .foregroundStyle(.black)
                                        .frame(maxWidth: .infinity,  alignment: .trailing)
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: 75, alignment: .leading)
                            .padding()
                            .background(.greyBlue)
                            .cornerRadius(28)
                            
                            VStack(spacing: 15) {
                                Text("Post History")
                                    .fontWeight(.semibold)
                                
                                NavigationLink(destination: PostHistoryView().toolbar(.hidden, for: .tabBar)) {
                                    Image(systemName: "arrow.up.forward")
                                        .foregroundStyle(.black)
                                        .frame(maxWidth: .infinity,  alignment: .trailing)
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: 75, alignment: .leading)
                            .padding()
                            .background(.customYellow)
                            .cornerRadius(28)
                        }
                        .frame(maxWidth: .infinity)
                        
                        NavigationLink(destination: SignInView().navigationBarBackButtonHidden(true)) {
                            Text("Log Out")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                        .padding()
                        .background(.customPink)
                        .cornerRadius(20)
                    }
                    .padding(.horizontal, 20)
                    
                    
                }
                .padding()
            }
        }
}

#Preview {
    ProfileView(name: "Jane Doe", username: "janedoe", major: "Architecture", year: "Sophomore", description: "Some description about yourself")
}
