//
//  NewHomeView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 10/8/21.
//

import SwiftUI

struct NewHomeView: View {
    
    @State var Paths: [[Vertex<String>]] = []
    
    let db = AppDatabase()
    
    @State var resortIndex = 0
    @State var startPointString = ""
    @State var endPointString = ""
    
    @State var includeLevel = false
    
    @State var isError = false
    
    @State private var isStartSearching = false
    @State private var isEndSearching = false
    
    @FocusState private var isStartFocused: Bool
    @FocusState private var isEndFocused: Bool
    
    @State private var isReadyToSumbit = false
    
    @State private var isUserCreated = false
    
    @State private var showSheet = false
    
    private func getMatchingResorts(index: Int, lifts: [step]) -> [step]{
        
        var newLifts: [step] = []
        
        for n in lifts {
            if n.stepResortID == index{
                newLifts.append(n)
            }
        }
        return newLifts
    }
    
    private func getResortIndex(name: String, array: [resort]) -> Int{
        for counter in 0..<array.count {
            if array[counter].resortName == name {
                return counter
            }
        }
        return -1
    }
    
    func getStrings(lifts: [step]) -> [String]{
        var names: [String] = []
        for Step in lifts {
            names.append(Step.stepName)
        }
        return names
    }
    
    func getColor(str: String, array: [String]) -> Color {
        var color: Color
        if array.contains(str) {
            color = Color.green
        }
        else {
            color = Color.blue
        }
        return color
    }
    
    func generateRoute(start: String, end: String, level: Int) {
        let Start = getPoint(name: start)!
        let End = getPoint(name: end)!
        
        let startVertex = buttermilkAdjacencyList.vertextList[Start]
        let endVertex = buttermilkAdjacencyList.vertextList[End]
        
        print(startVertex.data)
        print(startVertex.level)
        print(buttermilkAdjacencyList.adjacencyDict[startVertex])
        
        Paths = buttermilkAdjacencyList.findAllPaths(from: startVertex, to: endVertex, level: level)!
    }
    
    var body: some View {
        
        db.copyDatabaseIfNeeded()
        
        let resortNames = db.getResorts()
        let lifts = db.getVerticesForDisplay()
        let names = getStrings(lifts: lifts)
        
        return NavigationView{
            VStack(alignment: .leading, spacing: 1) {
                
                let user = db.getUser()
                
                ScrollView {
                    
                    if user.userID > 2 {
                        Text("Welcome \(user.name) \(user.lastname), let's create a plan!")
                            .padding(.leading)
                    }
                    else {
                        Button("Create Profile", action: {
                            self.showSheet.toggle()
                        }).frame(width: 300, height: 50, alignment: .center)
                            .shadow(color: .gray, radius: 10, x: 5, y: 5)
                            .background(Color("accentColor-1"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(.leading)
                            .sheet(isPresented: $showSheet, content: {
                            CreateUserSheetView(showSheet: $showSheet, isUserCreated: $isUserCreated)
                        })
                    }
                    
                    Spacer()
                    
                    VStack{
                        Picker(selection: $resortIndex, label: Text("Select Resort") , content : {
                            ForEach(0..<resortNames.count, id: \.self) { res in
                                Text(resortNames[res].resortName)
                            }
                        }).foregroundColor(.white)
                            .frame(alignment: .center)
                            .padding(.leading, 24)
                            .font(.title)
                        .pickerStyle(.menu)
                        
                        Spacer()
                        Spacer()
                        
                        HStack{
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green)
                                .padding(.leading)
                            HStack {
                                TextField("Search Starting Point", text: $startPointString)
                                    .padding(.leading, 24)
                                    .focused($isStartFocused)
                            }
                            .padding()
                            .background(Color(.white))
                            .cornerRadius(5)
                            .onTapGesture {
                                isStartSearching.toggle()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(getColor(str: startPointString, array: names), lineWidth: 2))
                            
                            .padding(.horizontal)
                            .overlay(
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    Spacer()
                                    
                                }.padding(.horizontal, 32)
                                    .foregroundColor(.gray)
                            )
                            
                            if isStartSearching{
                                Button(action: {
                                    isStartSearching.toggle()
                                    startPointString = ""
                                    isStartFocused.toggle()
                                }, label: {
                                    Text("Cancel")
                                        .padding(.trailing, 32)
                                        .padding(.leading, 0)
                                })
                            }
                        }
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                        
                        let lifts = getMatchingResorts(index: resortIndex + 1, lifts: lifts)
                        
                        ForEach((0..<lifts.count).filter({lifts[$0].stepName.uppercased().contains(startPointString.uppercased()) && isStartFocused == true}), id: \.self) { num in
                            HStack{
                                Text(lifts[num].stepName)
                                    .onTapGesture {
                                        startPointString = lifts[num].stepName
                                    }
                                Spacer()
                            }.padding(.leading)
                            Divider ()
                                .background(Color(.systemGray4))
                                .padding(.leading)

                        }
                    }
                    
                    HStack{
                        Image(systemName: "circle.fill")
                            .foregroundColor(.red)
                            .padding(.leading)
                        HStack {
                            TextField("Search End Point", text: $endPointString)
                                .padding(.leading, 24)
                                .focused($isEndFocused)
                        }
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(5)
                        .onTapGesture {
                            isEndSearching.toggle()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                    .stroke(getColor(str: endPointString, array: names), lineWidth: 2))
                        .padding(.horizontal)
                        .overlay(
                            HStack{
                                Image(systemName: "magnifyingglass")
                                Spacer()
                                
                            }.padding(.horizontal, 32)
                                .foregroundColor(.gray)
                        )
                        
                        if isEndSearching{
                            Button(action: {
                                isEndSearching.toggle()
                                startPointString = ""
                                isEndFocused.toggle()
                            }, label: {
                                Text("Cancel")
                                    .padding(.trailing, 32)
                                    .padding(.leading, 0)
                            })
                        }
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
                    
                    let lifts = getMatchingResorts(index: resortIndex + 1, lifts: lifts)
                    
                    ForEach((0..<lifts.count).filter({lifts[$0].stepName.uppercased().contains(endPointString.uppercased()) && isEndFocused == true}), id: \.self) { num in
                        HStack{
                            Text(lifts[num].stepName)
                                .onTapGesture {
                                    endPointString = lifts[num].stepName
                                }
                            Spacer()
                        }.padding(.leading)
                        Divider ()
                            .background(Color(.systemGray4))
                            .padding(.leading)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    if isError && !names.contains(startPointString) && !names.contains(endPointString) && startPointString != "" && endPointString != ""{
                        Text("Can't find you inputs on the mountain, please try again")
                            .foregroundColor(Color.red)
                            .frame(alignment: .center)
                    }
                    
                    HStack{
                        Toggle("Include Level", isOn: $includeLevel)
                            .frame(width: 300, height: 50, alignment: .center)
                            .background(Color("Color"))
                            .foregroundColor(Color("accentColor-1"))
                            .padding(.leading, 24)
                    }.transition(.move(edge: .trailing))
                        .animation(.spring())
                    
                    HStack {
                        Button("Generate Route", action: {
                            if names.contains(startPointString) && names.contains(endPointString) {
                                if buttermilkAdjacencyList.adjacencyDict[TiehackTrail] != [] {
                                    print(Paths)
                                    if includeLevel{
                                        generateRoute(start: startPointString, end: endPointString, level: Int(user.level))
                                    }
                                    else {
                                        generateRoute(start: startPointString, end: endPointString, level: 3)
                                    }
                                    isReadyToSumbit.toggle()
                                    startPointString = ""
                                    endPointString = ""
                                    isStartFocused = false
                                    isEndFocused = false
                                }
                                else{
                                    createList()
                                    createEdges()
                                    print(Paths)
                                    if includeLevel{
                                        generateRoute(start: startPointString, end: endPointString, level: Int(user.level))
                                    }
                                    else {
                                        generateRoute(start: startPointString, end: endPointString, level: 3)
                                    }
                                    isReadyToSumbit.toggle()
                                    startPointString = ""
                                    endPointString = ""
                                    isStartFocused = false
                                    isEndFocused = false
                                }
                            }
                            else{
                                if startPointString != "" && endPointString != "" {
                                    isError = true
                                }
                            }
                            
                        })
                            .frame(width: 300, height: 50, alignment: .center)
                            .shadow(color: .gray, radius: 10, x: 5, y: 5)
                            .background(Color("accentColor-1"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(.leading, 24)
                            .transition(.move(edge: .trailing))
                            .animation(.spring())
                    }
                }
                
                NavigationLink(destination: RouteDisplayView(paths: Paths), isActive: $isReadyToSumbit) {EmptyView()}
                
            }.navigationTitle("Home")
                .background(Color("Color"))
                .accentColor(Color("accentColor-1"))
        }
    }
}

struct CreateUserSheetView: View {
    @Binding var showSheet: Bool
    @Binding var isUserCreated: Bool
    
    @State var Name: String = ""
    @State var Lastname: String = ""
    @State var Level: Int = 0
    
    var levels = ["Beginner", "Intermediate", "Expert"]
    
    @State var isValidated = true
    
    var body: some View {
        Form {
            TextField("Name", text: $Name)
            TextField("Lastname", text: $Lastname)
            Section{
                Picker(selection: $Level, label: Text("Level")) {
                    ForEach(0 ..< levels.count, id: \.self){ x in
                        Text(levels[x])
                    }
                }.pickerStyle(.menu)
            }
            
            if isValidated == false {
                Text("Please make sure your name and lastname are less than 50 characters").foregroundColor(.red)
            }
            
            Button ("Save Changes", action: {
                if Name.count < 20 && Lastname.count < 20 {
                    AppDatabase().createUser(nameV: Name, lastnameV: Lastname, levelV: Int64(Level))
                    self.showSheet.toggle()
                    self.isUserCreated.toggle()
                }
                else {
                    isValidated = false
                }
            })
        }.background(Color("Color"))
        .navigationBarTitle(Text("Sheet View"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            print("Dismissing sheet view...")
            self.showSheet.toggle()
        }) {
            Text("Done").bold()
        })
    }
}
            
struct NewHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NewHomeView()
    }
}
