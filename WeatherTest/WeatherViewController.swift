//
//  ViewController.swift
//  WeatherTest
//
//  Created by А Сафарян on 30.11.2020.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private lazy var table: UITableView = {
        let tableView = UITableView()
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: String(describing:WeatherTableViewCell.self))
        
        return tableView
    }()
    
    
    private func setupLayout() {
        view.addSubview(table)
        
        let constraints = [
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Погода"
        setupLayout()
        
    }

}

extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.cities[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Storage.cities.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = table.dequeueReusableCell(withIdentifier: String(describing: WeatherTableViewCell.self), for: indexPath) as?
            WeatherTableViewCell {
            cell.city = Storage.cities[indexPath.section][indexPath.row]
            return cell
        }
        return UITableViewCell()
        
    }
    
    
}

extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let city = Storage.cities[indexPath.section][indexPath.row]
        let cityDetailViewController = CityDetailViewController(city: city)
        
        present(cityDetailViewController, animated: true, completion: nil)
    }

}

