//
//  PrevPostDetailView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/20/24.
//

import SwiftUI

struct PrevPostDetailView: View {
    var post: PrevPost
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text(post.title)
                    .font(.custom("AveriaGruesaLibre-Regular", size: 32))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                
                HStack {
                    Text(post.subject)
                        .font(.system(size: 10))
                        .padding(10)
                        .background(.lightBlue)
                        .clipShape(.capsule)
                    
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
                
                Spacer()
                
            }
        }
        .frame(maxWidth: 350)
    }
}
