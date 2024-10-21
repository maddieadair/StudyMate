//
//  MorePostsView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/20/24.
//

import SwiftUI

struct MorePostsView: View {
    @State var shouldPresentSheet = false
    @StateObject private var viewModel = PostViewModel()
    @State private var searchText = ""
    @State private var majorSelection: String?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //                    Text("More Posts")
                    //                        .font(.custom("AveriaGruesaLibre-Regular", size: 40))
                    //                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Subject")
                        
                        Picker("Select Major", selection: $majorSelection)
                        {
                            Text("Please Select One").tag(String?.none)
                            
                            ForEach(majors, id: \.self) {
                                Text($0).tag($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .accentColor(.gray)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray)
                        )
                    }
                    
                    VStack(spacing: 25) {
                        
                        VStack {
                            ForEach(searchResults, id: \.id) { post in
                                PostRow(post: post)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
            }
            .navigationTitle("More Posts")
            .navigationBarTitleDisplayMode(.large)
            .frame(maxWidth: 350)
            
        }
        .searchable(text: $searchText)
        
    }
    
    var searchResults: [Post] {
        if searchText.isEmpty && (majorSelection == nil) {
            return viewModel.posts
        } else {
            var res: [Post] = viewModel.posts
            
            if !searchText.isEmpty {
                res = res.filter { $0.title.contains(searchText) }
            }
            if (majorSelection != nil) {
                res = res.filter { $0.subject.contains(majorSelection!) }
            }
            print(res)
            return res
        }
    }
    
}

#Preview {
    MorePostsView()
}
