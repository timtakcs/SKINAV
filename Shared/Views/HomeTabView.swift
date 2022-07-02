//
//  HomeTabView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 8/27/21.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
            TabView {
            NewHomeView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            MyRoutesView().tabItem {
                Image(systemName: "list.bullet.rectangle.fill")
                Text("My Routes")
            }
            SettingsView().tabItem{
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }
        }
    }
}



struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
