//
//  mapView.swift
//  Workout
//
//  Created by karim ounis on 11/03/2022.
//

import SwiftUI
import MapKit

struct mapView: View {
    
    @StateObject var mapData : MapModel
    
    var body: some View {
        Map(coordinateRegion: $mapData.region, showsUserLocation: true, annotationItems: mapData.annotationsItems){
            pin in MapPin(coordinate: pin.coordinate, tint: .accentColor)
        }
            .ignoresSafeArea()
            .accentColor(.pink)
            .onAppear{
                mapData.checkIfLocationServicesIsEnabled()
            }
        
    }
    
    
}

struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView(mapData: MapModel())
    }
}

