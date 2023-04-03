//
//  PropertySearchViewController.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-25.
//

import UIKit

final class PropertySearchViewController: UIViewController {
    private lazy var searchResultTableView = UITableView()
    private let dataStore = PropertySearchDataStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setUpView()
        loadData()
    }
}

extension PropertySearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataStore.itemAt(index: indexPath.row)
        switch item {
        case .highlightedProperty(let property):
            let cell: PropertyViewCell = tableView.dequeueReusableCell(withIdentifier: PropertyViewCell.cellIdentifier,
                                                                       for: indexPath) as! PropertyViewCell
            cell.configure(property: property, isHiglighted: true)
            return cell
        case .property(let property):
            let cell: PropertyViewCell = tableView.dequeueReusableCell(withIdentifier: PropertyViewCell.cellIdentifier,
                                                                       for: indexPath) as! PropertyViewCell
            cell.configure(property: property)
            return cell
        case .area(let area):
            let cell: AreaViewCell = tableView.dequeueReusableCell(withIdentifier: AreaViewCell.cellIdentifier,
                                                                   for: indexPath) as! AreaViewCell
            cell.configure(area: area)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Show detail view only for first item as per requirement
        if indexPath.row != 0 {
            return
        }
        let item = dataStore.itemAt(index: indexPath.row)

        switch item {
        case .highlightedProperty:
            let detailsView = PropertyDetailsViewController()
            navigationController?.pushViewController(detailsView, animated: true)
        case .property:
            let detailsView = PropertyDetailsViewController()
            navigationController?.pushViewController(detailsView, animated: true)
        case .area:
            return
        }
    }
}

private extension PropertySearchViewController {

    // MARK: Load Data

    private func loadData() {
        showLoader()
        dataStore.search { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoader()
            }
            switch result {
            case .success():
                DispatchQueue.main.async {
                    self?.searchResultTableView.reloadData()
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(alertTitle: Constants.Strings.generalErrorTitle,
                                    alertMessage: error.description)
                }
            }
        }
    }

    // MARK: Setup View

    private func setUpView() {
        view.addSubview(searchResultTableView)

        NSLayoutConstraint.activate([
            searchResultTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            searchResultTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            searchResultTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16.0),
            searchResultTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])

        searchResultTableView.translatesAutoresizingMaskIntoConstraints = false
        searchResultTableView.register(PropertyViewCell.self, forCellReuseIdentifier: PropertyViewCell.cellIdentifier)
        searchResultTableView.register(AreaViewCell.self, forCellReuseIdentifier: AreaViewCell.cellIdentifier)
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.separatorStyle = .none
    }
}
