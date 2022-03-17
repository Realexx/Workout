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
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true,
            annotationItems: $viewModel.annotationsItems) {
            annotation in MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude))
            
        }
        
    }
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView()
    }
}

