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
import Alamofire

//37.786882
//-122.399972

class MainViewController: UIViewController {
    
    var locationManager: CLLocationManager!
    var mapView: GMSMapView!
    var userMarker: GMSMarker?
    var userLocation: CLLocation?
    var restaurants: [Restaurant]? {
        didSet {
            updateMarkersOnMap(restaurants: restaurants)
        }
    }
    let services = AuthenticationServices()
    let restaurantServices = RestaurantServices()
    
    var restaurantMarkers: [GMSMarker]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congigureMapView()
        configureUserLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLogin()
    }
}

//MARK: - Data
extension MainViewController {
    func checkLogin() {
        if !AppUserDefaults.authentication.isAccessTokenExist() {
            showAuthenViewController()
        } else {
            callAPIGetNearbyRestaurants()
        }
    }
    
    func showAuthenViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let authenVC = storyBoard.instantiateViewController(withIdentifier: AuthenticationViewController.className) as! AuthenticationViewController
        authenVC.modalTransitionStyle = .crossDissolve
        present(authenVC, animated: true, completion: nil)
        authenVC.didAuthenticate = { [weak self] (_ success: Bool) in
            if success {
                self?.callAPIGetNearbyRestaurants()
            } else {
                self?.showAlert(message: AlertVC.AlertMessage.authenFail.rawValue, andTitle: AlertVC.AlertTitle.error.rawValue)
            }
        }
    }
    
    func callAPIGetNearbyRestaurants() {
        cancelRequests()
        firstly { () -> Promise<GetRestaurantsOutput> in
            let input = inputGetRestaurants()
            return  restaurantServices.getResaturants(input)
        }.then { [weak self] (output) -> Void in
            self?.restaurants = output.restaurants
        }.catch { [weak self] (error) in
            self?.showErrorAlert(message: error.localizedDescription)
        }
    }
    
    fileprivate func inputGetRestaurants() -> GetRestaurantsInput {
        let centerCoordinate = self.centerCoodinate()
        let input = GetRestaurantsInput(latitude: centerCoordinate.latitude, longitude: centerCoordinate.longitude)
        return input
    }
    
    fileprivate func centerCoodinate() -> CLLocationCoordinate2D {
        let center = self.mapView.center
        return self.mapView.projection.coordinate(for: center)
    }
    
    fileprivate func cancelRequests() {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
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
            userLocation = location
            updateCurrentUserMarkerWith(location: location)
        }
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

//MARK: - Map view delegate
extension MainViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        callAPIGetNearbyRestaurants()
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let inforView = InforWindowView.initFromNib()
        inforView.frame = CGRect(x: 0, y: 0, width: (self.view.frame.width - 30), height: 70)
      //  inforView.restaurant = Restaurant.testRestaurant()
        return inforView
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        return true
    }
}

//MARK: - Add a marker
extension MainViewController {
    fileprivate func updateMarkersOnMap(restaurants: [Restaurant]?) {
        removeAllMarkers()
        guard let restaurants = restaurants else {
            return
        }
        restaurantMarkers = [GMSMarker]()
        for restaurant in restaurants {
             restaurantMarkers?.append(addAMarkerWithRestaurantInfor(restaurant: restaurant))
        }
    }
    
    fileprivate func removeAllMarkers() {
        restaurantMarkers?.removeAll()
        self.mapView.clear()
        if let userLocation = userLocation {
            updateCurrentUserMarkerWith(location: userLocation)
        }
    }
    
    fileprivate func updateCurrentUserMarkerWith(location: CLLocation) {
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
    
    fileprivate func addAMarkerWithRestaurantInfor(restaurant: Restaurant) -> GMSMarker {
        let marker = GMSMarker()
        marker.title = restaurant.name
        marker.icon = UIImage(named: "icon_restaurant.pdf")
        marker.map = self.mapView
        marker.isFlat = true
        marker.tracksInfoWindowChanges = true
        let coordinate = CLLocationCoordinate2D(latitude: restaurant.coordinates.latitude, longitude: restaurant.coordinates.longtitude)
        marker.position = coordinate
        return marker
    }
}


