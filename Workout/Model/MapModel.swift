//
//  Map.swift
//  Workout
//
//  Created by karim ounis on 11/03/2022.
//

import MapKit
import CoreLocation
import Foundation

struct MyAnnotationItem: Identifiable{
    var coordinate : CLLocationCoordinate2D
    let id = UUID()
}

enum MapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}

final class MapModel : NSObject,ObservableObject,CLLocationManagerDelegate {
    // MKCoordianteRegion correspond a la variable qui observera le changement de localisation de la part de l'utilisateur
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager : CLLocationManager?
    
    var distance : Int = 0
    
    var annotationsItems = [
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(
            latitude: -119.891054, longitude: -121.891054
        ))
    ]
    
    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        /*
    // todo cool https://www.hackingwithswift.com/quick-start/swiftui/how-to-read-the-users-location-using-locationbutton
        
        // todo pins https://www.mongodb.com/developer/how-to/realm-swiftui-maps-location/
         
         // Distance between pin and user
         https://stackoverflow.com/questions/44139786/calculate-distance-between-my-location-and-a-mapkit-pin-on-swift
         
         // vidéo :
         https://www.youtube.com/watch?v=vfWxwDfX30I
         
         */
        
        let coord = locationManager?.location != nil ? self.locationManager?.location!.coordinate : CLLocationCoordinate2D()
        
    
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Code qui traque la localisation de l'utilisateur
        locations.last.map {
                    region = MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                    )
                }
    }
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }else{
            print("Show alert")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus{

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted ")
        case .denied:
            print("You dare to denied !")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center:locationManager.location!.coordinate , span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
        
    }
}
