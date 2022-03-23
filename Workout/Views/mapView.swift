//
//  mapView.swift
//  Workout
//
//  Created by karim ounis on 11/03/2022.
//

import SwiftUI
import MapKit

struct mapView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: viewModel.annotationsItems){
            pin in MapPin(coordinate: pin.coordinate, tint: .accentColor)
        }
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

