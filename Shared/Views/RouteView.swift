//
//  RouteView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 8/9/21.
//

import SwiftUI

struct RouteView: View {
    
    let route: route
    
    var databaseSteps = AppDatabase()
    
    var StepStore = stepStore()
    
    @State private var multiSelection = Set<UUID>()
    
    func findLevel(Step: step) -> String{
        var color: String
        
        switch Step.stepLevel {
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
    
    func findColor(Step: step) -> Color{
        var tintColor: Color
        
        switch Step.stepLevel {
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
        
        databaseSteps.copyDatabaseIfNeeded()
        
        let routeSteps = databaseSteps.getStepsNew(id: route.routeID)
        
        StepStore.steps = routeSteps
        
        return VStack{
            Text(route.routeName).fontWeight(.bold).foregroundColor(Color("accentColor-1"))
            
            NavigationLink(destination: CurrentRouteView(timeRemaining: Int(route.time), StepStore: StepStore)){
                Text("Add to Current Route").fontWeight(.bold).font(.title2).foregroundColor(Color("accentColor-1"))
            }
            .padding(10)
            
            ScrollView {
                VStack {
                    
                    ForEach (0..<routeSteps.count, id: \.self) {n in
                        HStack{
                            Image(systemName: findLevel(Step: routeSteps[n]))
                                .foregroundColor(findColor(Step: routeSteps[n]))
                            Text(routeSteps[n].stepName)
                            Spacer()
                        }.padding(.leading)
                        Divider ()
                            .background(Color(.systemGray4))
                            .padding(.leading)
                    }
                }
            }
        }.background(Color("Color"))
    }
}


