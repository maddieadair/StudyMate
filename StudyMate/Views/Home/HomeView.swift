//
//  HomeView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct post {
    var title: String
    var description: String
    var time: String
    var username: String
    var subject: String
    var firstName: String
    var lastName: String
    var image: String?
    var profilePic: String
}

var placeholder = [
    post(title: "Diode Models and Circuits", description: "Some text", time: "Yesterday", username: "johndoe", subject: "Electrical Engineering", firstName: "John", lastName: "Doe", profilePic: "profilePic"),
    
    post(title: "Atomic Orbitals", description: "Some text", time: "Yesterday", username: "johndoe", subject: "Electrical Engineering", firstName: "John", lastName: "Doe", profilePic: "profilePic"),
    
    post(title: "Zeroth Law of Thermodynamics", description: "Some text", time: "Yesterday", username: "johndoe", subject: "Electrical Engineering", firstName: "John", lastName: "Doe", profilePic: "profilePic")
]

struct HomeView: View {
    @State var shouldPresentSheet = false
    
    var body: some View {
        VStack {
            
            Button(action: {
                shouldPresentSheet.toggle()
            }) {
                Text("New Post")
                    .bold()
                    .padding()
                    .background(.customBlue)
                    .foregroundStyle(.customPink)
                    .clipShape(.capsule)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .sheet(isPresented: $shouldPresentSheet, content: {
                AddPostView()
            })
            
            Text("Home")
                .font(.custom("AveriaGruesaLibre-Regular", size: 40))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Recent Posts")
                        .font(.system(size: 24, weight: .medium))
                    Spacer()
                    NavigationLink(destination: EditProfileView().toolbar(.hidden, for: .tabBar)) {
                        Text("View More")
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
//                ForEach(placeholders, id: \.self) { name in
//                    NavigationLink(destination: Text("Second view")) {
//                        Text(name)
//                    }
//                }
            }
            
            Spacer()
            
        }
        .frame(maxWidth: 325)
    }
}

#Preview {
    HomeView()
}
