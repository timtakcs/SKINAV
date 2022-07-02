//
//  SettingsView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/20/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var showSheet = false
    
    var levels = ["Beginner", "Intermediate", "Expert"]
    
    let database = AppDatabase()
    
    var body: some View {
        
//        database.copyDatabaseIfNeeded()
        let user = database.getUser()
        return NavigationView{
            VStack {
                Text("Name: \(user.name)")
                    .fontWeight(.bold)
                
                Divider()
            
                Text("Lastname: \(user.lastname)")
                    .fontWeight(.bold)
                
                Divider()
                
                Text("Level: \(levels[Int(user.level)])")
                    .fontWeight(.bold)
                
                Button("Edit Profile", action: {
                    self.showSheet.toggle()
                }).padding()
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color("accentColor-1"))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .sheet(isPresented: $showSheet, content: {
                    EditUserSheetView(User: user, showSheet: $showSheet)
                })
            }.navigationTitle("Settings")
                .padding(EdgeInsets(top: 17, leading: 21, bottom: 17, trailing: 21))
        }
    }
}

struct EditUserSheetView: View {
    var User: userProp
    @Binding var showSheet: Bool
    
    @State var Name: String = ""
    @State var Lastname: String = ""
    @State var Level: Int = 0
    
    let database = AppDatabase()
    
    var levels = ["Beginner", "Intermediate", "Expert"]
    
    @State var isValidated = true
    
    var body: some View {
        
        database.copyDatabaseIfNeeded()
        
        return Form {
            TextField("Name", text: $Name)
            TextField("Lastname", text: $Lastname)
            Section{
                Picker(selection: $Level, label: Text("Level")) {
                    ForEach(0 ..< levels.count, id: \.self){ x in
                        Text(levels[x])
                    }
                }
            }.pickerStyle(.menu)
            .background(Color.white)
            
            Button ("Save Changes", action: {
                if Name.count < 50 && Lastname.count < 50 {
                    database.editUser(user: User, Name: Name, Lastname: Lastname, Level: Level)
                    self.showSheet.toggle()
                }
                else {
                    isValidated = false
                }
            })
        }
        .navigationBarTitle(Text("Sheet View"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            print("Dismissing sheet view...")
            self.showSheet.toggle()
        }) {
            Text("Done").bold()
        })
        
        if isValidated == false {
            Text("Please make sure your name and lastname are less than 50 characters")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
