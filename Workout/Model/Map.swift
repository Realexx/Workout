//
//  Map.swift
//  Workout
//
//  Created by karim ounis on 11/03/2022.
//

struct MyAnnotationItem: Identifiable{
    var coordinate : CLLocationCoordinate2D
    let id = UUID()
}


import MapKit
enum MapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
}

final class ContentViewModel : NSObject,ObservableObject,CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager : CLLocationManager?
    
    let sourceCoordinate = CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2707)

    var annotationsItems : [MyAnnotationItem] = [MyAnnotationItem(coordinate: CLLocationCoordinate2D(
        latitude: -119.891054, longitude: -121.891054
     ))]
    
    /*
     MyAnnotationItem(coordinate: CLLocationCoordinate2D(
         latitude: -119.891054, longitude: -121.891054
      ))
     */
    
    func getUserLocation() {
        locationManager?.requestLocation()
        /*
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
         */
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let latestLocation = locations.first else {
            // Erreur
            return
        }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error.localizedDescription)
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
