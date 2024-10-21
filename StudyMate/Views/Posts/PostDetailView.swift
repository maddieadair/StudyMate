//
//  PostDetailView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct PostDetailView: View {
    var post: Post
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text(post.title)
                    .font(.custom("AveriaGruesaLibre-Regular", size: 32))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                
                Text(post.subject)
                    .font(.system(size: 10))
                    .padding(10)
                    .background(.lightBlue)
                    .clipShape(.capsule)
                
                HStack {
                    HStack {
                        NavigationLink(destination: OtherProfileView(fullName: post.fullName, username: post.username, major: post.subject, year: "Sophomore", description: "Some text", profilePic: post.profilePic)){
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .aspectRatio(1.2, contentMode: .fill)
                                .overlay(
                                    AsyncImage(url: post.profilePic) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .offset(x: -4.0, y: 0.0)
                                        
                                    } placeholder: {
                                        ProgressView()
                                    }
                                )
                        }
                            .frame(width: 40, height: 40, alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 10,
                                                        style: .continuous))
                        VStack(alignment: .leading, spacing: 6) {
                            Text(post.fullName)
                                .foregroundStyle(.black)
                                .font(.system(size: 14, weight: .semibold))
                            Text("@\(post.username)")
                                .font(.system(size: 12))
                                .foregroundStyle(.black)
                        }
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Text(post.time)
                        .frame(alignment: .trailing)
                        .foregroundStyle(.black)
                        .font(.system(size: 12))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(post.description)
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack() {
                        ForEach(post.image, id: \.self) { i in
                            AsyncImage(url: i) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
                
                Button(action: {
                    print("message")
                }) {
                    HStack(spacing: 12) {
                        Text("Message")
                            .bold()
                        
                        Image(systemName: "paperplane")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                    }
                    .padding()
                    .background(.customBlue)
                    .clipShape(.capsule)
                    .foregroundStyle(.customPink)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Spacer()
                
            }
        }
        .frame(maxWidth: 350)
    }
}
