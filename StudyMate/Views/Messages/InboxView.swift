//
//  MessagesView.swift
//  StudyMate
//
//  Created by Maddie Adair on 10/19/24.
//

import SwiftUI

struct InboxView: View {
    @StateObject private var chatModel = ChatModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Inbox")
                    .font(.custom("AveriaGruesaLibre-Regular", size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                
                Spacer()
                    .frame(height: 50)
                
                VStack {
                    ForEach(chatModel.chats, id: \.id) { chat in
                        ChatRow(chat: chat)
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
    InboxView()
}
