//
//  CityDetailViewController.swift
//  WeatherTest
//
//  Created by А Сафарян on 30.11.2020.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    private let city: City
////        didSet {
////            guard let city = city else { return }
////
////            nameCity.text = city.name
////            temperatureLabel.text = city.temperature.description
////            weatherLabel.text = city.weather
////        }
//    }
    
    init(city: City) {
        self.city = city
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nameCity: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 2
        label.toAutoLayout()
        return label
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        setupLayout()
        configure()
      
    }
    
    private func configure() {
        nameCity.text = city.name
        temperatureLabel.text = city.temperature.description
        weatherLabel.text = city.weather
    }
    
    fileprivate func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(nameCity)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(weatherLabel)
        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            nameCity.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            nameCity.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: nameCity.bottomAnchor, constant: 12),
            temperatureLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            weatherLabel.topAnchor.constraint(equalTo:temperatureLabel.bottomAnchor,constant: 12),
            weatherLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 12),
            weatherLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 12),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
