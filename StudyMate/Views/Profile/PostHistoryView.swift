//
//  PostHistoryView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct PostHistoryView: View {
    @StateObject private var prevPostModel = PrevPostViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Post History")
                    .font(.custom("AveriaGruesaLibre-Regular", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                
                Spacer()
                    .frame(height: 50)
                
                VStack(spacing: 25) {
                    ForEach(prevPostModel.prevPosts, id: \.id) { post in
                        PrevPostRow(post: post)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
        }
        .frame(maxWidth: 350)
    }
}

#Preview {
    PostHistoryView()
}
