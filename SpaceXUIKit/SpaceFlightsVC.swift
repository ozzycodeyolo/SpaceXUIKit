//
//  SpaceFlightsVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class SpaceFlightsVC: UIViewController {
    
    let dummyData: [String] = ["Karel", "Evžen", "Roman", "Libor", "Karel 1", "Evžen 1", "Roman 1", "Libor 1", "Karel 2", "Evžen 2", "Roman 2", "Libor 2", "Karel 3", "Evžen 3", "Roman 3", "Libor 3", "Karel 4", "Evžen 4", "Roman 4", "Libor 4"]
    
    let spaceFlightsViewModel = SpaceFlightsViewModel()
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flights"
        view.backgroundColor = .systemBackground
        
        addSubviews()
        configureTableView()
        addConstraints()
        configurePullToRefresh()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
        
        spaceFlightsViewModel.loadFlights(handeler: handle)
    }
    
}

#warning("Pull to refresh: missing implementation")
extension SpaceFlightsVC {
    
    private func configurePullToRefresh() {
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshing), for: .valueChanged)
    }
    
    @objc
    private func handleRefreshing() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
        }
        
    }
    
    private func handle(result: Result<Void, FlightError>) {
        switch result {
        case .success():
            tableView.reloadData()
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}

// MARK: - Table functions

extension SpaceFlightsVC: UITableViewDataSource {
    
    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spaceFlightsViewModel.flights.count
    }
    
    // Cell creation and setup
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.reusableID, for: indexPath) as! FlightCell
        cell.flightLabel.text = spaceFlightsViewModel.flights[indexPath.row].name
        return cell
    }
    
}

extension SpaceFlightsVC: UITableViewDelegate {
    
    // Navigate to detail screen by selecting table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let spaceFlightDetailVC = SpaceFlightDetailVC()
        spaceFlightDetailVC.flightName = spaceFlightsViewModel.flights[indexPath.row].name
        navigationController?.pushViewController(spaceFlightDetailVC, animated: true)
    }
    
}

// MARK: - UI Configuration

extension SpaceFlightsVC {
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FlightCell.self, forCellReuseIdentifier: FlightCell.reusableID)
        
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
}
