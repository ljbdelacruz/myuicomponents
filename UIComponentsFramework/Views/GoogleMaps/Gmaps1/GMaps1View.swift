//
//  GMaps1View.swift
//  UIComponentsFramework
//
//  Created by Lainel John Dela Cruz on 5/30/19.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import GoogleMaps

public class GMaps1View: UIView, GMSMapViewDelegate {
    static var apiKEY:String="";
    public let xibname:String="GMaps1View";
    private var locationManager:CLLocationManager = CLLocationManager();
    public var markers:[GMSMarker]=[];
    
    @IBOutlet var contentview: GMSMapView!
    
    override public init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    public func commonInit() {
        Bundle.main.loadNibNamed(xibname, owner: self, options: nil)
        contentview.fixInView(self)
        locationManager.delegate=self;
        contentview.delegate=self;
    }
    
    //api key
    //AIzaSyCYjTlZstilVJIbB4YLGFIwSLDKPThFG_c
    //use this one time only when starting the app
    
    static func setupGmap(api:String){
        //invoke setup here for apikey
        GMSServices.provideAPIKey(api)
        
    }
    
    
}

//MARK: location permission setup first in your info.plist to use your location
extension GMaps1View:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
        contentview.isMyLocationEnabled = true
        contentview.settings.myLocationButton = true
    }
    
    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        contentview.camera=setupCamera(location: location.coordinate, zoom: 15, bearing: 0, viewAngle: 0)
        locationManager.stopUpdatingLocation()
    }
}
//MARK: Camera map setup
extension GMaps1View{
    func setupCamera(long:CLLocationDegrees, lat:CLLocationDegrees, zoom:Float)->GMSCameraPosition{
        return GMSCameraPosition(latitude: lat, longitude: long, zoom: zoom);
    }
    func setupCamera(location:CLLocationCoordinate2D, zoom:Float, bearing:CLLocationDirection, viewAngle:Double)->GMSCameraPosition{
        return GMSCameraPosition(target: location, zoom: zoom, bearing: bearing, viewingAngle: viewAngle)
    }
}
//MARK: Setting up marker functions
extension GMaps1View{
    func setupMarker(title:String, desc:String, long:CLLocationDegrees, lat:CLLocationDegrees){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = title
        marker.snippet = desc;
        marker.map = contentview;
        self.markers.append(marker);
    }
}
//MARK: Geocoding functions
extension GMaps1View{
    public func region(coordinate:CLLocationCoordinate2D, radius:CLLocationDistance, identifier:String) -> CLCircularRegion {
        let region = CLCircularRegion(center: coordinate,
                                      radius: radius,
                                      identifier: identifier)
//        region.notifyOnEntry = (geotification.eventType == .onEntry)
//        region.notifyOnExit = !region.notifyOnEntry
        return region
    }
}

