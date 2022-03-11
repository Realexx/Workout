//
//  ViewController.swift
//  Workout
//
//  Created by karim ounis on 11/03/2022.
// usefull tuto : https://www.youtube.com/watch?v=hWMkimzIQoU

import Foundation
import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    private var locationManager:CLLocationManager?
    
    /*
    override func viewDidLoad() {
            super.viewDidLoad()
            latLngLabel.frame = CGRect(x: 20, y: view.bounds.height / 2 - 50, width: view.bounds.width - 40, height: 100)
            view.addSubview(latLngLabel)
            getUserLocation()
        }
    */
    

    private let latLngLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .systemFill
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 26)
            return label
    }()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            latLngLabel.text = "Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)"
        }
    }
    
}
