//
//  NotificationsView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct NotificationsView: View {
    @StateObject private var chatModel = ChatRequestModel()
    @StateObject private var suggestedModel = PostViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Notifications")
                    .font(.custom("AveriaGruesaLibre-Regular", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                
                Spacer()
                    .frame(height: 50)
                
                if (chatModel.requests.count > 0 || suggestedModel.suggestedPosts.count > 0){
                    VStack(spacing: 25) {
                        if (chatModel.requests.count > 0){
                            
                            HStack {
                                Text("Chat Requests")
                                    .font(.system(size: 24, weight: .medium))
                                Spacer()
                                NavigationLink(destination: MorePostsView().toolbar(.hidden, for: .tabBar)) {
                                    Button(action: {
                                        chatModel.requests.removeAll()
                                    }) {
                                        Text("Dismiss All")
                                            .bold()
                                            .font(.system(size: 12))
                                            .padding(8)
                                            .background(.customBlue)
                                            .clipShape(.capsule)
                                            .foregroundStyle(.customPink)
                                    }
                                }
                            }
                            
                            VStack {
                                ForEach(chatModel.requests, id: \.id) { request in
                                    NavigationLink(destination: Text("Second view")) {
                                        RequestRow(request: request)
                                    }
                                }
                            }
                        }
                        
                        
                        if (suggestedModel.suggestedPosts.count > 0){
                            HStack {
                                Text("Suggested for you")
                                    .font(.system(size: 24, weight: .medium))
                                Spacer()
                                Button(action: {
                                    suggestedModel.suggestedPosts.removeAll()
                                }) {
                                    Text("Dismiss All")
                                        .bold()
                                        .font(.system(size: 12))
                                        .padding(8)
                                        .background(.customBlue)
                                        .clipShape(.capsule)
                                        .foregroundStyle(.customPink)
                                }
                            }
                            
                            VStack {
                                ForEach(suggestedModel.suggestedPosts.prefix(3), id: \.id) { post in
                                    NavigationLink(destination: Text("Second view")) {
                                        PostRow(post: post)
                                    }
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                       
                }
                else {
                    Text("Nothing here to see!")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .frame(maxWidth: 350)
    }
}

#Preview {
    NotificationsView()
}
