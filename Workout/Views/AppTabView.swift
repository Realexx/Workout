//
//  AppTabView.swift
//  Workout
//
//  Created by schlageter alex on 04/03/2022.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        
        
       
        TabView {
            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Timer")
                }
            
            
            
            WorkoutsView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Workouts")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
