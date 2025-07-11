//
//  ContentView.swift
//  BIrthdaysApp
//
//  Created by Scholar on 7/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "John", birthday: .now),
        Friend(name: "Samantha", birthday: Date(timeIntervalSince1970: 0)) ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack {
        //id tells the computer that each string taken in belongs to one person
        //friend in builds a row as each person. stacks on top of eachother
        List(friends, id: \.name) { friend in
            HStack {
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
            }
            
        }
        .navigationTitle("my awesome bday app")
        .safeAreaInset(edge: .bottom) {
            VStack(alignment: .center, spacing: 20) {
                Text("New Birthday")
                    .font(.headline)
                DatePicker(selection: $newBirthday, in: Date.distantPast...Date.now,displayedComponents:.date) {
                    //textFieldStyle adds a box around the text input section
                    TextField( "Name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                    
                }
                Button("Save Birthday") {
                    let newFriend = Friend(name: newName, birthday: newBirthday)
                    friends.append(newFriend)
                    newName = ""
                    newBirthday = .now
                }
                .padding()
                .background(.bar)
                
            }
        }
        
        }
    }
    
}

#Preview {
    ContentView()
}
