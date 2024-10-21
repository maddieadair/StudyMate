//
//  HomeView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "bell.fill")
                    }

                InboxView()
                    .tabItem {
                        Image(systemName: "message")
                    }
                
                ProfileView(name: "Jane Doe", username: "janedoe", major: "Architecture", year: "Sophomore", description: "Some description about yourself")
                    .tabItem {
                        Image(systemName: "person.fill")
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
