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
    
    var distance : Int = 0
    
    override init(){
        super.init()
        
        print("Création du map view model")
        
        
    }
    
    func startRecord(){
        print("Test StartRecord")
        let map = MapModel()
        map.startRecord()
        maps.append(map)
        distance = map.dist
    }
    
    func stopRecord(){
        print("Test StopRecord")
        let map = maps.last
        map?.stopRecord()
    }
    
    
   
    
}
