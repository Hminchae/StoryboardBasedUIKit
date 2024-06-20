//
//  SearchRestaurantViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/26/24.
//

import UIKit
import MapKit
import CoreLocation

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
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationMap()
        configurationLayout()
        //configureSemgentedControl()
        checkDeviceLocationAuthorization()
        locationManager.delegate = self
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

extension SearchRestaurantViewController {
    // 💡1️⃣ 사용자에게 권한 요청을 하기위해, iOS 위치 서비스 활성화 여부 체크
    func checkDeviceLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() { // 📕 타입메서드와 타입프로퍼티에 접근 가능함
            checkCurrentLocationAuthorization()
        } else {
            print("위치 서비스가 꺼져 있어서, 위치 권한을 요청을 할 수 없어요")
        }
    }
    // 💡2️⃣ 현재 사용자 위치 권한 상태 확인
    func checkCurrentLocationAuthorization() {
        var status: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            status = locationManager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        
        switch status {
        case .notDetermined:
            print("이 권한에서만 권한 문구를 띄워줄 수 있음")
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest// ⏳ 업데이트 주기
            locationManager.requestWhenInUseAuthorization()
        
        case .denied:
            print("iOS 설정 창으로 이동하라는 얼럿을 띄워줘")
        case .authorizedWhenInUse:
            print("위치 정보 알려달라고 로직을 구성할 수 있음")
            locationManager.startUpdatingLocation() //
        default:// 🚨 업데이트에 대응
            print(status)
        }
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        
        // 📍 맵뷰, 맵뷰에 어노테이션
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
}
// 3️⃣ 위치 관련 프로토콜 선언 : CLLocationManagerDelegate
extension SearchRestaurantViewController: CLLocationManagerDelegate {
    // 5️⃣ 사용자 위치를 성공적으로 가지고 온 경우
    // 코드 구성에 따라 여러번 호출이 될 수 도 있다
    // didUpdateLocations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(#function)
        print(locations)
        
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            print(coordinate.latitude)
            print(coordinate.longitude)
            
            setRegionAndAnnotation(center: coordinate)
        }

        // -> 📢 startUpdatingLocation을 했으면 더이상 위치를 안 받아도 되는 시점에서는 stop 을 외쳐야 함
        locationManager.stopUpdatingLocation()
    }
    // 6️⃣ 사용자 위치를 가지고 오지 못했거나
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
    }
    // 7️⃣ 사용자 권한 상태가 변경이 될 때(iOSS14)
    // 사용자가 허용했었는데 아이폰 설정에서 나중에 허용을 거부한다면..
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function, "iOS14+")
        checkDeviceLocationAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function, "iOS14-")
    }
}
