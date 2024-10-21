//
//  AddPostView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI
import PhotosUI

struct AddPostView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var subject: String = ""
    
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    @State private var majorSelection = majors[0]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
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
                        
                        Picker("Major", selection: $majorSelection)
                        {
                            ForEach(majors, id: \.self) {
                                Text($0)
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
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Description")
                        TextField(text: $description, prompt: Text("Lorem Ipsum...")) {
                            Text(description)
                        }
                        .padding()
                        .frame(width: .infinity, height: 200, alignment: .topLeading)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray)
                        )
                    }
                    
                    PhotosPicker(selection: $selectedItems, maxSelectionCount: 3, matching: .any(of: [.screenshots, .images])) {
                        HStack(spacing: 12) {
                            Text("Add Image")
                                .bold()
                            
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                        }
                        .padding()
                        .background(.customBlue)
                        .clipShape(.capsule)
                        .foregroundStyle(.customPink)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .onChange(of: selectedItems) {
                        Task {
                            selectedImages.removeAll()
                            
                            for item in selectedItems {
                                if let image = try? await item.loadTransferable(type: Image.self) {
                                    selectedImages.append(image)
                                }
                            }
                        }
                    }
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack() {
                            ForEach(0..<selectedImages.count, id: \.self) { i in
                                selectedImages[i]
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                            }
                        }
                    }
                    
                }
                
            }
            .frame(maxWidth: 350)
        }
    }
}

#Preview {
    AddPostView()
}
