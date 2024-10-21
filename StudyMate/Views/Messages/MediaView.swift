//
//  MediaView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/21/24.
//

import SwiftUI

struct MediaView: View {
    var chat: Chat
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
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
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 40)
                .padding(.bottom, 20)
                                
                Divider()
                
                Spacer()
                    .frame(height: 40)

                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Media")
                        .font(.system(size: 24, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<6, id: \.self) { i in
                            AsyncImage(url: URL(string:"https://picsum.photos/200")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: 300, maxHeight: 300)
                                    .cornerRadius(20)
                                
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
            }
        }
        .frame(maxWidth: 350)
    }
}
