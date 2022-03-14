//
//  mapView.swift
//  Workout
//
//  Created by karim ounis on 11/03/2022.
//

import SwiftUI
import MapKit

struct mapView: View {
    @StateObject private var viewModel = MapModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(.pink)
            .onAppear{
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView()
    }
}

