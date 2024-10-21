//
//  PrevPostRow.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/20/24.
//
import SwiftUI

struct PrevPostRow: View {
    var post: PrevPost

    
    var body: some View {
        NavigationLink(destination: PrevPostDetailView(post: post).toolbar(.hidden, for: .tabBar)) {
            HStack {
                VStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(post.title)
                            .foregroundStyle(.black)
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: 130, alignment: .leading)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        Text(post.description)
                            .font(.system(size: 12))
                            .foregroundStyle(.black)
                            .frame(maxWidth: 130, alignment: .leading)
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Text(post.time)
                    .frame(alignment: .trailing)
                    .foregroundStyle(.black)
                    .font(.system(size: 12))
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.customGrey)
        .cornerRadius(16)
    }
}
