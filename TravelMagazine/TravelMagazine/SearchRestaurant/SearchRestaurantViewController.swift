//
//  SearchRestaurantViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/26/24.
//

import UIKit
import MapKit

enum FoodCategory: Int, CaseIterable {
    case all = 0
    case koreanFood
    case chinaFood
    
    var title: String {
        switch self {
        case .all:
            return "전체"
        case .koreanFood:
            return "한식"
        case .chinaFood:
            return "중식"
        }
    }
}

class SearchRestaurantViewController: UIViewController {
    private var mapView: MKMapView!
    
    @IBOutlet weak var categorySeg: UISegmentedControl!
    @IBOutlet weak var storeListButton: UIButton!
    @IBOutlet weak var myMap: MKMapView!
    
    var restaurantInfo: [Restaurant] = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationMap()
        configurationLayout()
        //configureSemgentedControl()
    }
    
    func configureSemgentedControl() {
        for item in FoodCategory.allCases {
            categorySeg.setTitle(item.title, forSegmentAt: item.rawValue)
        }
        
        //categorySeg.addTarget(self, action: #selector(segClicked), for: .valueChanged)
    }
    
    @objc func segClicked(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
}

extension SearchRestaurantViewController {
    
    func configurationMap() {
        // 지도의 중심 좌표와 줌 레벨 설정
        let center = CLLocationCoordinate2D(latitude: 37.516329, longitude: 126.889686) // 영등포구
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        
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
    
    func configurationLayout() {
        storeListButton.setImage(UIImage(named: "foodButton"), for: .normal)
        
    }
    

}

