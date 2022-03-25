//
//  ViewController.swift
//  Workout
//
//  Created by karim ounis on 11/03/2022.
// usefull tuto : https://www.youtube.com/watch?v=hWMkimzIQoU

import Foundation
import UIKit
import MapKit

class MapViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
    
    @Published var maps: [MapModel] = []
    
    var distance : Double = 0
    
    override init(){
        super.init()
        
        print("Création du map view model")
        setMapTest()
        
        
    }
    
    func setMapTest() {
        maps.append(MapModel())
    }
    
    func startRecord(){
        print("Test StartRecord")
        // let map = Map()
        let map = maps.last
        map?.startRecord()
       // maps.append(map)
        distance = map!.dist
        print("debug startrecord",distance)
    }
    
    func stopRecord(){
        print("Test StopRecord")
        let map = maps.last
        map?.stopRecord()
        
        var work = Workout.workoutsData.first!
        work.distance = distance
        
    }
    
    func pauseRecord(){
        let map = maps.last
        map!.pauseRecord()
    }
    /*
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let map = maps.last
        
        let p1 = MKPlacemark(coordinate: map?.annotationsItems.first!.coordinate)

      // Boston
        let p2 = MKPlacemark(coordinate: map?.annotationsItems.last!.coordinate)

        
        let request = MKDirections.Request()
         request.source = MKMapItem(placemark: p1)
         request.destination = MKMapItem(placemark: p2)
         request.transportType = .automobile

         let directions = MKDirections(request: request)
         directions.calculate { response, error in
           guard let route = response?.routes.first else { return }
           mapView.addAnnotations([p1, p2])
           mapView.addOverlay(route.polyline)
           mapView.setVisibleMapRect(
             route.polyline.boundingMapRect,
             edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
             animated: true)
         }
        
        return mapView
      }
     */
    
    
    
    
   
    
}
