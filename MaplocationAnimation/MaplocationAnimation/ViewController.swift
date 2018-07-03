//
//  ViewController.swift
//  MaplocationAnimation
//
//  Created by MacPro on 03/07/2018.
//  Copyright © 2018 Centaline. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    // 使用 struct 定义使用的常量
    struct Constants {
        struct MapViewIdentifiers {
            static let sonarAnnotationView = "sonarAnnotationView"
        }
    }
    
    let regionRadius: CLLocationDistance = 3000
    let latitude = 40.758873
    let longitude = -73.985134
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 设置初始位置
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        centerMapOnLocation(initialLocation)
        // 根据定位添加气泡
        let annotation = Annotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), title: nil, subtitle: nil)
        mapView.addAnnotation(annotation)
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        // Reuse the annotation if possible.
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.MapViewIdentifiers.sonarAnnotationView)
        
        if annotationView == nil {
            annotationView = SonarAnnotationView(annotation: annotation, reuseIdentifier: Constants.MapViewIdentifiers.sonarAnnotationView)
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: false)
    }
    
    
}

