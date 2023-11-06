//
//  ViewController.swift
//  mapKitUIkit
//
//  Created by Kaua Miguel on 01/11/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    let mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    let coordinate = CLLocationCoordinate2D(latitude: 40.781392202320774, longitude:  -73.97413045277663)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Put the map delegate as this viewController
        mapView.delegate = self
        
        setmapConstraints()
        
        let pin = MKPointAnnotation()
        pin.title = "Central"
        pin.coordinate = coordinate
        
        mapView.addAnnotation(pin)
        
    }

    func setmapConstraints(){
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}


extension ViewController : MKMapViewDelegate{
    //Function that changes the view of an annotatino
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        
        //Create an annotation with a id
        var annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Custom")
        annotationView.image = UIImage(systemName: "house.fill")
        
        return annotationView
    }
}

