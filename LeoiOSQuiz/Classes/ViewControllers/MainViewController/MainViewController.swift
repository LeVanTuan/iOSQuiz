//
//  MainViewController.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import PromiseKit
import GoogleMaps

class MainViewController: UIViewController {
    
    var locationManager: CLLocationManager!
    var mapView: GMSMapView!
    var userMarker: GMSMarker?
    
    let services = AuthenticationServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congigureMapView()
        configureUserLocation()
        if !AppUserDefaults.authentication.isAccessTokenExist() {
            getToken()
        }
    }
    
    func getToken() {
        firstly { () -> Promise<AuthenticationOutput> in
            let input = AuthenticationInput()
            return services.getAccessToken(input)
            }.then { (output) -> Void in
                print("Token: ",output.authen.accessToken)
                AppUserDefaults.authentication = output.authen
            }.catch {(error) in
                print(error)
            }.always {
        }
    }
}

//MARK: - Map view
extension MainViewController {
    fileprivate func congigureMapView() {
        mapView = GMSMapView()
        mapView.frame = self.view.frame
        self.view.addSubview(mapView)
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.addObserver(self, forKeyPath: "myLocation", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let change = change else {
            return
        }
        if change[NSKeyValueChangeKey.oldKey] == nil {
            let location = change[NSKeyValueChangeKey.newKey] as! CLLocation
            updateCurrentMarkerWith(location: location)
        }
    }
}

//MARK: - Map view delegate
extension MainViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let inforView = InforWindowView.initFromNib()
        inforView.frame = CGRect(x: 0, y: 0, width: (self.view.frame.width - 30), height: 70)
        inforView.restaurant = Restaurant.testRestaurant()
        return inforView
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        return true
    }
}

//MARK: - User location
extension MainViewController {
    fileprivate func configureUserLocation() {
        locationManager = CLLocationManager()
        locationManager.distanceFilter = 50.0
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        if mapView != nil, let location = locationManager.location {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: kDefaultMapZoom, bearing: 0, viewingAngle: 0)
        }
    }
}

//MARK: - Location Manager Delegate
extension MainViewController: CLLocationManagerDelegate {

}

//MARK: - Add a marker
extension MainViewController {
    fileprivate func updateCurrentMarkerWith(location: CLLocation) {
        if self.userMarker == nil {
            let marker = newUserMarker()
            self.userMarker = marker
        }
        self.userMarker?.position = location.coordinate
        
    }
    
    fileprivate func newUserMarker() -> GMSMarker {
        let marker = GMSMarker()
        marker.title = kStringUserLocationTitle
        marker.icon = UIImage(named: "icon_user_marker")
        marker.map = self.mapView
        marker.isFlat = true
        marker.tracksInfoWindowChanges = true
        return marker
    }
}


