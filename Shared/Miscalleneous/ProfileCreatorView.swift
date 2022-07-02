//
//  ProfileCreatorView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/19/21.
//

import SwiftUI

struct ProfileCreatorView: View {
    
    @State var name: String = ""
    @State var lastname: String = ""
    
    @State private var levelIndex = 0
    var levels = ["Beginner", "Intermediate", "Expert"]
        
    var databaseUser = AppDatabase()
    
    var body: some View {
        Form{
            Section{
                TextField("Name" , text: $name)
                    .padding()
                    .navigationTitle("Create Profile")
            }
            
            Section{
                TextField("Lastname", text: $lastname)
                    .padding()
            }
            
            Section{
                Picker(selection: $levelIndex, label: Text("Level")) {
                    ForEach(0 ..< levels.count){
                        Text(self.levels[$0]).tag($0)
                    }
                }
            }
            .background(Color.white)
            
        }
        NavigationLink(destination: HomeTabView()) {
            Text("Create Account")
                .frame(width: 200, height: 50, alignment: .center)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
            Button("", action: {
                print("Form submitted")
                databaseUser.createUser(nameV: self.name, lastnameV: self.lastname, levelV: Int64(self.levelIndex))
            })
        }
        Spacer()
    }
}

struct ProfileCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCreatorView()
    }
}

