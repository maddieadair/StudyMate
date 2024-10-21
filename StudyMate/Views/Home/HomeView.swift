//
//  HomeView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct HomeView: View {
    @State var shouldPresentSheet = false
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                shouldPresentSheet.toggle()
            }) {
                HStack(spacing: 12) {
                    Text("New Post")
                        .bold()
                    
                    Image(systemName: "pencil")
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
            .sheet(isPresented: $shouldPresentSheet, content: {
                AddPostView()
            })
            
            
            Text("Home")
                .font(.custom("AveriaGruesaLibre-Regular", size: 40))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: 50)
            
            VStack(spacing: 25) {
                HStack {
                    Text("Recent Posts")
                        .font(.system(size: 24, weight: .medium))
                    Spacer()
                    NavigationLink(destination: MorePostsView().toolbar(.hidden, for: .tabBar)) {
                        HStack {
                            Text("View More")
                                .foregroundStyle(.black)
                                .font(.system(size: 12, weight: .medium))
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10, height: 10)
                                .foregroundStyle(.black)
                        }
                    }
                }
                
                VStack {
                    ForEach(viewModel.posts.prefix(3), id: \.id) { post in
                        PostRow(post: post)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            
            Spacer()
            
        }
        .frame(maxWidth: 350)
    }
}

#Preview {
    HomeView()
}
