//
//  LocationManager.swift
//  WeatherApp
//
//  Created by dzikru arya on 17/12/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading: Bool = false
    @Published var haveLocation: Bool = false
    @Published var latitude: CLLocationDegrees = 0.0
    @Published var longitude: CLLocationDegrees = 0.0
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
//        give delay 3 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.manager.requestWhenInUseAuthorization()
            self.manager.requestLocation()
        }
//        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first?.coordinate else { return }
//        if location have coordinate change haveLocation to true
        haveLocation = true
        latitude = location.latitude
        longitude = location.longitude
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        print("error locaiton")
        isLoading = false
    }
    
}
