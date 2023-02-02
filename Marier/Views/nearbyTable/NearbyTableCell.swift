//
//  NearbyTableCell.swift
//  Marier
//
//  Created by MacBook M1 on 05/01/23.
//

import UIKit
import MapKit
import CoreLocation

class NearbyTableCell: UITableViewCell {

    @IBOutlet weak var locationView: MKMapView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    let manager = CLLocationManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        locationView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func cellConfig(data: RandomListModel){
        name.text = data.name
        gender.text = data.sex
    }
    
}


extension NearbyTableCell:MKMapViewDelegate,CLLocationManagerDelegate{
    
    
    func configure(data: Location) {
           // Configure the map view with the data
        let location = CLLocationCoordinate2D(latitude: data.coordinates[0], longitude: data.coordinates[1])
           let region = MKCoordinateRegion(center: location, latitudinalMeters: 1, longitudinalMeters: 2)
           locationView.setRegion(region, animated: true)
        showLocation(location: location)
       }
    
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
//           if (annotation is MKUserLocation) {
//               return nil
//           }
//
//           let reuseId = "test"
//
//           var anView = locationView.dequeueReusableAnnotationView(withIdentifier: reuseId)
//           if anView == nil {
//
//               anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//               anView?.frame.size = CGSize(width: 10, height: 10)
////               anView?.image = UIImage(named:"1")
//               anView?.canShowCallout = true
//           } else {
//               anView?.annotation = annotation
//           }
//           return anView
//       }

    func showLocation(location:CLLocationCoordinate2D) {

           let dropPin = MKPointAnnotation()
           dropPin.coordinate = location

           locationView!.addAnnotation(dropPin)

           self.locationView?.setRegion(MKCoordinateRegion(center: location, latitudinalMeters: 500, longitudinalMeters: 500), animated: true)
       }
    
    
}
