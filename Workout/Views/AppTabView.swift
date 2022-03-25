//
//  AppTabView.swift
//  Workout
//
//  Created by schlageter alex on 04/03/2022.
//

import SwiftUI

struct AppTabView: View {
    @State var mapViewModel : MapViewModel
    var profilViewModel : ProfileViewModel = ProfileViewModel()
    var body: some View {
        TabView {
            TimerView(mapViewModel: mapViewModel)
                .tabItem {
                    Image(systemName: "timer")
                    Text("Timer")
                }
            
            WorkoutsView(mapViewModel: mapViewModel)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Workouts")
                }
            
            ProfileView(userData: profilViewModel)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(mapViewModel: MapViewModel())

    }
}
