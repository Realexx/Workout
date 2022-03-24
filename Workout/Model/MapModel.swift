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

final class MapModel : NSObject,ObservableObject,CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager : CLLocationManager?

    var annotationsItems : [MyAnnotationItem] = []
    
    var dist : Int = 0 
    
    /*
     MyAnnotationItem(coordinate: CLLocationCoordinate2D(
         latitude: -119.891054, longitude: -121.891054
      ))
     
    
    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()

        // todo https://www.hackingwithswift.com/quick-start/swiftui/how-to-read-the-users-location-using-locationbutton
        let coord = locationManager?.location != nil ? self.locationManager?.location!.coordinate : CLLocationCoordinate2D()
    }
     */
    
    func startRecord(){
        createPin(coordinate: region.center)
        //dist = distance(to: region.center,)(,)
    }
    
    func stopRecord(){
        createPin(coordinate: region.center)
        // Tracer la ligne : https://www.youtube.com/watch?v=A4x8EfPmkqI&t=50s
    }
    
    func createPin(coordinate : CLLocationCoordinate2D){
        annotationsItems.append(MyAnnotationItem(coordinate: coordinate))
    }
    
    
    //
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let latestLocation = locations.first else {
            // Erreur
            return
        }
        
        // update the region with the location (user)
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error.localizedDescription)
    }
    
    
    // Locations services
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
            //region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
            break

        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
        
    }
}
