//
//  ChatView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/21/24.
//

import SwiftUI

struct ChatView: View {
    var chat: Chat
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .aspectRatio(1.2, contentMode: .fill)
                        .overlay(
                            AsyncImage(url: chat.profilePic) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .offset(x: -4.0, y: 0.0)
                                
                            } placeholder: {
                                ProgressView()
                            }
                            
                        )
                        .frame(width: 40, height: 40, alignment: .leading)
                        .clipShape(RoundedRectangle(cornerRadius: 10,
                                                    style: .continuous))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(chat.fullName)
                            .foregroundStyle(.black)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: 130, alignment: .leading)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        Text("@\(chat.username)")
                            .font(.system(size: 12))
                            .foregroundStyle(.black)
                            .frame(maxWidth: 130, alignment: .leading)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: MediaView(chat: chat).toolbar(.hidden, for: .tabBar)){
                        Image(systemName: "photo.fill")
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(8)
                            .background(.customBlue)
                            .cornerRadius(12)
                            .foregroundStyle(.customPink)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
                
                
                Spacer()
                    .frame(height: 50)
                
                VStack {
                    ForEach(chat.messages, id: \.id) { message in
                        Text(message.message)
                        Text(message.dateTime)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
            }
        }
        .frame(maxWidth: 350)
    }
}

//#Preview {
//    ChatView()
//}
