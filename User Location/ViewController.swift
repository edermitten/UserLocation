//
//  ViewController.swift
//  User Location
//
//  Created by Eder Mitten on 9/20/18.
//  Copyright © 2018 Eder Mitten. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        //let latitude = userLocation.coordinate.latitude
        //let longitude = userLocation.coordinate.longitude
        
        //let latDelta: CLLocationDegrees = 0.05
        //let lonDelta: CLLocationDegrees = 0.05
        
        //let spam : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        //let location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        //let region : MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: spam)
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error!)
            } else {
                if let placemark = placemarks?[0] {
                    //print(placemark)
                    var subThoroughfare = ""
                    if placemark.subThoroughfare != nil {
                        subThoroughfare = placemark.subThoroughfare!
                    }
                    
                    var thoroughfare = ""
                    if placemark.thoroughfare != nil {
                        thoroughfare = placemark.thoroughfare!
                    }
                    
                    var subLocality = ""
                    if placemark.subLocality != nil {
                        subLocality = placemark.subLocality!
                    }
                    
                    var subAdministrativeArea = ""
                    if placemark.subAdministrativeArea != nil {
                        subAdministrativeArea = placemark.subAdministrativeArea!
                    }
                    
                    var postalCode = ""
                    if placemark.postalCode != nil {
                        postalCode = placemark.postalCode!
                    }
                    
                    var country = ""
                    if placemark.country != nil {
                        country = placemark.country!
                    }
                    
                    print(subThoroughfare + thoroughfare + "\n" + subLocality + "\n" + subAdministrativeArea + "\n" + postalCode + "\n" + country)
                    
                }
            }
        }
        
        //self.map.setRegion(region, animated: true)
        /*
        let annotation = MKPointAnnotation()
        annotation.title = ""
        annotation.subtitle = ""
        annotation.coordinate = coordinates
        
        self.map.addAnnotation(annotation)
        */
        
    }


}

