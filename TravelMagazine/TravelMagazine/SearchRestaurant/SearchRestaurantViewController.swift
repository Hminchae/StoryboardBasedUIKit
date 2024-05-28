//
//  SearchRestaurantViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/26/24.
//

import UIKit
import MapKit

class SearchRestaurantViewController: UIViewController {
    private var mapView: MKMapView!
    
    @IBOutlet weak var storeListButton: UIButton!
    @IBOutlet weak var myMap: MKMapView!
    
    var restaurantInfo: [Restaurant] = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeListButton.setImage(UIImage(named: "foodButton"), for: .normal)
        
        // 지도의 중심 좌표와 줌 레벨 설정
        let center = CLLocationCoordinate2D(latitude: 37.52361111, longitude: 126.8983417) // 영등포구
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        myMap.setRegion(region, animated: true)
        myMap.showsUserLocation = true
        
        // 각 위치에 마커 추가
        for i in 0..<restaurantInfo.count {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: restaurantInfo[i].latitude,
                                                           longitude: restaurantInfo[i].longitude)
            annotation.title = restaurantInfo[i].name
            annotation.subtitle = restaurantInfo[i].category
            myMap.addAnnotation(annotation)
        }
    }
}
