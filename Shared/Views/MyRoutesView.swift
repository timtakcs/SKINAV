//
//  MyRoutesView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/20/21.
//

import SwiftUI

struct MyRoutesView: View {
    
    var databaseRoutes = AppDatabase()
        
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        let routes = databaseRoutes.getRoutes()
        databaseRoutes.copyDatabaseIfNeeded()
        
        return NavigationView {
            List(routes) { route in
                NavigationLink(destination: RouteView(route: route)) {
                    RouteRow(route: route)
                }
            }.navigationTitle("My Routes")
        }
    }
}

struct RouteRow: View {
    var route: route
    
    var body: some View {
        Text(route.routeName)
    }
}

struct MyRoutesView_Previews: PreviewProvider {
    static var previews: some View {
        MyRoutesView()
    }
}
