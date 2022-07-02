//
//  CurrentRouteView.swift
//  Skiing App
//
//  Created by Timur Takhtarov on 7/20/21.
//

import SwiftUI
import Combine
import UserNotifications

struct CurrentRouteView: View {

    @State var timeRemaining: Int
    @State var timerRunning = false
    @State var allComplete = false
    
    @ObservedObject var StepStore: stepStore
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func convertSeconds(seconds: Int) -> String{
         let mins = seconds / 60
         let sec = seconds % 60
        
        return String(format: "%02i:%02i", mins, sec)
    }
    
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time Remaining"
        content.subtitle = "You have 5 minutes remaining until arrival"
        content.sound = .default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func findLevel(level: Int) -> String{
        var color: String
        
        switch level {
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
    
    func findColor(level: Int) -> Color{
        var tintColor: Color
        
        switch level {
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
        ZStack{
            if allComplete {
                VStack{
                    Text("You have completed your route")
                    NavigationLink("Return to Home", destination: HomeTabView())
                }.padding()
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 10, x: 10, y: 10)
            }

            VStack {
                
                HStack {
                    Button("Start", action: {
                        timerRunning = true
                    }).foregroundColor(Color("accentColor-1"))
                    Button("Pause", action: {
                        timerRunning = false
                    }).foregroundColor(Color("accentColor-1"))
                }
                
                Text(convertSeconds(seconds: timeRemaining))
                    .onReceive(timer) {_ in
                        if timeRemaining > 0 && timerRunning == true {
                            timeRemaining -= 1
                        }
                        else if timeRemaining < 300 {
                            self.sendNotification()
                        }
                        else {
                            timerRunning = false
                        }
                        
                    }
                
                Button("Complete Next Step", action: {
                    if StepStore.steps.count == 1 {
                        StepStore.steps.remove(at: 0)
                        allComplete = true
                    }
                    else{
                        StepStore.steps.remove(at: 0)
                    }
                }).foregroundColor(Color("accentColor-1"))
                
                Button("Test", action: {
                    timeRemaining = 305
                    self.sendNotification()
                })
                
                ScrollView {
                    VStack {
                        ForEach (0..<StepStore.steps.count, id: \.self) {n in
                            HStack{
                                Image(systemName: findLevel(level: StepStore.steps[n].stepLevel))
                                    .foregroundColor(findColor(level: StepStore.steps[n].stepLevel))
                                Text(StepStore.steps[n].stepName)
                                Spacer()
                            }.padding(.leading)
                            Divider ()
                                .background(Color(.systemGray4))
                                .padding(.leading)
                        }
                    }
                    
                }.navigationBarTitle("Current Route")
                    .navigationBarItems(trailing: EditButton())
            }
        }
    }
}


