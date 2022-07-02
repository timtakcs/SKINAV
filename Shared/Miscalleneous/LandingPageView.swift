//
//  LandingPageView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/19/21.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager()

    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) {(success, error) in
            if let error = error {
                print("ERROR: \(error)")
            }
            else {
               print("SUCCESS")
            }
        }
    }
}

struct LandingPageView: View {
    var body: some View {
        VStack{
            NavigationLink(destination: ProfileCreatorView()){
                Text("Create Profile")
                    .navigationBarTitle(Text("Welcome"))
                    .padding()
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.simultaneousGesture(TapGesture().onEnded{
                NotificationManager.instance.requestAuthorization()
            })
            
            NavigationLink(destination: HomeTabView()) {
                Text("Continue as Guest")
                    .padding()
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.simultaneousGesture(TapGesture().onEnded{
                NotificationManager.instance.requestAuthorization()
            })
        }
    }
}

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}
