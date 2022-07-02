//
//  RouteDisplayView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/20/21.
//

import SwiftUI

struct RouteDisplayView: View {
    
    var paths: [[Vertex<String>]]
    
    var databaseRoute = AppDatabase()
    
    @State private var multiSelection = Set<UUID>()
    
    @State private var showSheet = false
    
    @State var routeName: String = ""
    
    var body: some View {
        
        databaseRoute.copyDatabaseIfNeeded()
        
        return VStack {
            Text("Generated Route")
                .fontWeight(.bold)
                .font(.title2)
                .foregroundColor(Color("accentColor-1"))
        
            List(0..<paths.count) { route in
                NavigationLink(destination: RouteStepView(steps: paths[route], index: route)) {
                    CertainRoute(steps: paths[route], index: route)
                }
            }
        }.background(Color("Color"))
    }
}


struct CertainRoute: View {
    
    var steps: [Vertex<String>]
    let index: Int
    let user = AppDatabase().getUser()
    @State var L = false
    
    func convertSeconds(seconds: Int) -> String{
         let mins = seconds / 60
         let sec = seconds % 60
        
        return String(format: "%02i:%02i", mins, sec)
    }
    
    var body: some View {
        VStack {
            Text("Route \(index + 1)")
                .background(Color("Color"))
            Text(convertSeconds(seconds: buttermilkAdjacencyList.getTime(array: steps, userLevel: 3)))
                .background(Color("Color"))
        }.background(Color("Color"))
    }
    
}

