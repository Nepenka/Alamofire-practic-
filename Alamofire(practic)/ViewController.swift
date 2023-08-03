//
//  ViewController.swift
//  Alamofire(practic)
//
//  Created by 123 on 2.08.23.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    let imageView: UIImageView = .init()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let imageURL = "https://classpic.ru/wp-content/uploads/2017/10/30325/mokraja-kisa-sidit-na-kuhne.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        activityIndicator.startAnimating()
        getImage(url: imageURL)
    }
    func setupUI() {
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func getImage(url: String) {
        AF.download(url).responseData { (response) in
            
            if let data = response.value {
                let imageData = UIImage(data: data)
                
                
                self.imageView.image = imageData
                self.activityIndicator.stopAnimating()
            }
        }
    }
}

