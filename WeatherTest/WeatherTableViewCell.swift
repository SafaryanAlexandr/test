//
//  WeatherTableViewCell.swift
//  WeatherTest
//
//  Created by А Сафарян on 30.11.2020.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    var city: City? {
        didSet {
            guard let city = city else { return }
            
            nameCity.text = city.name
            temperatureLabel.text = city.temperature.description
            weatherLabel.text = city.weather
        }
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
    
    func setupLayout(){
        contentView.addSubview(nameCity)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(weatherLabel)
        
        let constraints = [
            nameCity.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            nameCity.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            temperatureLabel.topAnchor.constraint(equalTo: nameCity.topAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            weatherLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            weatherLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 6),
            weatherLabel.topAnchor.constraint(equalTo: nameCity.bottomAnchor, constant: 6),
            weatherLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -12),
            weatherLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
         
        ]
        NSLayoutConstraint.activate(constraints
        )
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
        fatalError("init(coder:) has not been implemented")
    }
    
}
