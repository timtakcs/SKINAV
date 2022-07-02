//
//  RouteStepView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 8/25/21.
//

import SwiftUI

struct RouteStepView: View {
    @State private var multiSelection = Set<UUID>()
    @State private var showSheet = false
    
    let steps: [Vertex<String>]
    let index: Int
    
    let database = AppDatabase()
    
    func convertForCurrentRoute(path: [Vertex<String>]) -> [step] {
        var convertedPath: [step] = []
        for vertex in path {
            var step = step()
            step.stepName = vertex.data
            step.stepLevel = vertex.level
            convertedPath.append(step)
        }
        return convertedPath
    }
    
    func findLevel(step: Vertex<String>) -> String{
        var color: String
        
        switch step.level {
        case 1:
            color = "rectangle.fill"
        case 2:
            color = "square.fill"
        case 3:
            color = "diamond.fill"
        default:
            color = "arrowtriangle.up.fill"
        }
        return color
    }
    
    func findColor(step: Vertex<String>) -> Color{
        var tintColor: Color
        
        switch step.level {
        case 1:
            tintColor = Color.green
        case 2:
            tintColor = Color.blue
        case 3:
            tintColor = Color.black
        default:
            tintColor = Color.gray
        }
        return tintColor
    }
    
    var body: some View {
        
        database.copyDatabaseIfNeeded()
        
        let StepStore = stepStore()
        StepStore.steps = convertForCurrentRoute(path: steps)
        
        let user = database.getUser()
        
        let time = findTime(array: steps, userLevel: user.level)
        
        return VStack {
            Text("Route \(index + 1)")
            
            NavigationLink(destination: CurrentRouteView(timeRemaining: time, StepStore: StepStore)){
                Text("Add to Current Route").fontWeight(.bold).font(.title2).foregroundColor(Color("accentColor-1"))
            }
            .padding(10)
            
            List(steps) { step in
                HStack{
                    Image(systemName: findLevel(step: step))
                        .foregroundColor(findColor(step: step))
                    Text(step.data)
                }
            }.sheet(isPresented: $showSheet, content: {
                SaveRoute(route: steps, showSheet: $showSheet)
            })
            
            Button("Save Route", action: {
                self.showSheet.toggle()
            }).foregroundColor(Color("accentColor-1"))
        }.background(Color("Color"))
    }
}

struct SaveRoute: View {
    var route: [Vertex<String>]
    @Binding var showSheet: Bool
    @State var routeName = ""
    @State var rating = 0
    @State var isValidated = true
    
    let user = AppDatabase().getUser()
    
    var ratings = ["hand.thumbsup", "hand.thumbsdown"]
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Route Name", text: $routeName)
                Picker("Rating", selection: $rating) {
                    ForEach(0..<ratings.count, id: \.self) {n in
                        Image(systemName: ratings[n])
                    }
                }.pickerStyle(.menu)
                Button ("Submit", action: {
                    if routeName.count < 50 {
                        AppDatabase().saveRouteNew(name: routeName, opinion: rating, array: route, level: Int(user.level))
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
                Text("Please make sure your route name is less than 50 characters").foregroundColor(.red)
            }
            
        }.background(Color("Color"))
    }
}

