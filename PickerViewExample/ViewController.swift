//
//  ViewController.swift
//  PickerViewExample
//
//  Created by Mallonee, Sawyer - Student on 1/31/23.
//

import UIKit
import MapKit
import CoreLocation

class AnnotationsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    @IBOutlet weak var locationPicker: UIPickerView!
    
    @IBOutlet weak var locationView: MKMapView!
    
    @IBOutlet weak var locationFind: UINavigationItem!
    
    var locations = ["Denver", "Chicago", "New York City", "Orlando", "San Diego", "Omaha"]
    
    func numberOfComponents(in locationPicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ locationPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    
    func pickerView(_ locationPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        locations[row]
    }

    @IBAction func findLocationButton(_ sender: UIBarButtonItem) {
    }
    
    private func DenverLocation(){
        let DenverPoint = MKPointAnnotation()
        DenverPoint.coordinate = CLLocationCoordinate2D(latitude: 39.7392, longitude: 104.9903)
        DenverPoint.title = "Denver"
        self.locationView.addAnnotation(DenverPoint)
    }
    
    func mapView(_ locationView:MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil }
        
        var Denver = locationView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if Denver == nil{
            Denver = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            Denver?.canShowCallout = true
        } else {
            Denver?.image = UIImage(named: "Marker")
            
            Denver?.annotation = annotation
        }
        
        return Denver
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(locationView)
        locationPicker.dataSource = self
        locationPicker.delegate = self
        locationView.delegate = self
    }
}
