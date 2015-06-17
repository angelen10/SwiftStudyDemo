//
//  ViewController.swift
//  DemoMapKit
//
//  Created by pandazheng on 15/6/17.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate , MKMapViewDelegate{
    
    @IBOutlet weak var mapView : MKMapView?
    
    var locationManager : CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    func setup()
    {
        self.locationManager.delegate = self
        self.locationManager.distanceFilter = kCLHeadingFilterNone
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView?.showsUserLocation = true
    }
    
    func mapView(mapView: MKMapView!, didAddAnnotationViews views: [AnyObject]!) {
        let annotationView = views[0] as! MKAnnotationView
        let region = MKCoordinateRegionMakeWithDistance(annotationView.annotation.coordinate, 250, 250)
        self.mapView?.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

