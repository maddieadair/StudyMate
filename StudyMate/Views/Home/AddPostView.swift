//
//  AddPostView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct AddPostView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var subject: String = ""

    var body: some View {
        
        VStack(spacing: 70) {
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Button("Confirm") {
                    dismiss()
                }
            }
            .padding(.top, 20)
            
            VStack(spacing: 30) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Title")
                    TextField(text: $title, prompt: Text("Some Title...")) {
                        Text(title)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray)
                    )
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Subject")
                    TextField(text: $subject, prompt: Text("Please select a subject")) {
                        Text(subject)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray)
                    )
                }
                
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Description")
                    TextField(text: $description, prompt: Text("Lorem Ipsum...")) {
                        Text(description)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 200, alignment: .topLeading)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray)
                    )
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: 325)
    }
}

#Preview {
    AddPostView()
}
