//
//  TravelPlaceViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/30/24.
//

import UIKit
import MapKit
import Kingfisher
import Cosmos

class CityInfoDetailViewController: UIViewController {
    
    @IBOutlet weak var cityMainImage: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityDescriptionLabel: UILabel!
    
    @IBOutlet weak var cityLocationLabel: UILabel!
    @IBOutlet weak var cityDetailMap: MKMapView!
    
    @IBOutlet weak var rateView: CosmosView!
    var cityDetailData: Travel?
    
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationData()
        configurationLayout()
    }
    
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension CityInfoDetailViewController {
    func configurationData() {
        guard let data = cityDetailData else { return }
        
        title = data.title
        
        // 별점 이미지
        if let grade = data.grade {
            rateView.rating = grade
            rateView.text = "(\(grade))"
        } else {
            rateView.rating = 0
            rateView.text = "(0.0)"
        }
    
        let url = URL(string: data.travel_image ?? "")
        cityMainImage.kf.setImage(with: url)
        
        cityNameLabel.text = data.title
        cityDescriptionLabel.text = data.description
        
        // 지도
        if let latitude = data.latitude, let longitude = data.longitude {
            
            let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude) // 영등포구
            let region = MKCoordinateRegion(center: center,
                                            span: MKCoordinateSpan(latitudeDelta: 0.05,
                                                                   longitudeDelta: 0.05))
            cityDetailMap.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude,
                                                           longitude: longitude)
            annotation.title = data.title
            annotation.subtitle = "평점: \(String(describing: data.grade!))"
            
            cityDetailMap.addAnnotation(annotation)
        }
    }
    
    func configurationLayout() {
        
        cityMainImage.contentMode = .scaleAspectFill
        
        cityNameLabel.font = UIFont.pretendard(size: 24, weight: .semibold)
        cityDescriptionLabel.font = UIFont.pretendard(size: 17, weight: .regular)
        cityDescriptionLabel.textColor = .lightGray
        cityLocationLabel.text = "위치 미리보기"
        cityLocationLabel.textColor = .label
        
        dismissButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        dismissButton.setTitle("", for: .normal)
        dismissButton.tintColor = .label
    }
}
