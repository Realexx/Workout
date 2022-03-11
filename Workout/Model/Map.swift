//
//  Map.swift
//  Workout
//
//  Created by karim ounis on 11/03/2022.
//

import MapKit
enum MapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
}

final class ContentViewModel : NSObject,ObservableObject,CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager : CLLocationManager?
    
    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)")
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
    
    func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus{

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted ")
        case .denied:
            print("You dare denied !")
        case .authorizedAlways,.authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
        
    }
}
