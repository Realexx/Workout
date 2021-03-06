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
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
}

final class MapModel : NSObject,ObservableObject,CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager : CLLocationManager?

    var annotationsItems : [MyAnnotationItem] = []
    
    var stopUpdate = true
    
    var dist : Double = 0
    @Published var location: CLLocation?
    

    override init(){
        super.init()
        locationManager?.delegate = self
    }
    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()

        // todo https://www.hackingwithswift.com/quick-start/swiftui/how-to-read-the-users-location-using-locationbutton
       // let coord = locationManager?.location != nil ? self.locationManager?.location!.coordinate : CLLocationCoordinate2D()
    }
     
    
    func startRecord(){
        guard let locationManager = locationManager else {
            return
        }
        stopUpdate = false
        
        locationManager.startUpdatingLocation()

        createPin(coordinate: region.center)
        print("Debug startRecord",region.center.latitude,"+",region.center.longitude)
        //dist = distance(to: region.center,)(,)
    }
    
    func stopRecord(){
        guard let locationManager = locationManager else {
            return
        }
        locationManager.stopUpdatingLocation()
        createPin(coordinate: region.center)
        
        stopUpdate = true
        
        dist = 0 
        
        print("Debug stopRecord",region.center.latitude,"+",region.center.longitude)
        // Tracer la ligne : https://www.youtube.com/watch?v=A4x8EfPmkqI&t=50s
    }
    
    func pauseRecord(){
        guard let locationManager = locationManager else {
            return
        }
        stopUpdate = false
        locationManager.stopUpdatingLocation()
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
            
            
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MapDetails.defaultSpan)
            if(!(self.annotationsItems.isEmpty || self.stopUpdate)){
                self.dist = self.getDistance(depart: self.annotationsItems.first!.coordinate, arrive: latestLocation.coordinate)
            }
            
        }
    }
    
    func getDistance(depart : CLLocationCoordinate2D, arrive: CLLocationCoordinate2D ) -> Double{
        MKMapPoint(depart).distance(to: MKMapPoint(arrive))
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
            locationManager.stopUpdatingLocation()
        case .authorizedAlways,.authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            //print("Test checkLocation ",locationManager.location)
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
