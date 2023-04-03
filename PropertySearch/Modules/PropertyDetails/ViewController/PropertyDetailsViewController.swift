//
//  PropertyDetailsViewController.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import UIKit

final class PropertyDetailsViewController: UIViewController {
    private lazy var propertyDetailTableView = UITableView()
    private let dataStore = PropertyDetailsDataStore()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpView()
        loadData()
    }
}

extension PropertyDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataStore.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.numberOfRowsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = dataStore.sectionType(for: indexPath.section)

        switch sectionType {
        case .imageAddressPrice(let addressline1,
                                let addressline2,
                                let price,
                                let imageURL):
            let cell = tableView.dequeueReusableCell(withIdentifier: PropertyMainViewCell.cellIdentifier,
                                                     for: indexPath) as! PropertyMainViewCell
            cell.configure(addressLine1: addressline1,
                           addressLine2: addressline2,
                           askingPrice: price,
                           imageURL: imageURL)
            return cell
        case .description(let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: PropertyDescriptionViewCell.cellIdentifier,
                                                     for: indexPath) as! PropertyDescriptionViewCell
            cell.configure(description: text)
            return cell

        case .attribute(let attributes):
            let cell = tableView.dequeueReusableCell(withIdentifier: PropertyAttributeViewCell.cellIdentifier,
                                                     for: indexPath) as! PropertyAttributeViewCell
            let attribute = attributes[indexPath.row]
            cell.configure(attribute: attribute)
            return cell
        }
    }
}

private extension PropertyDetailsViewController {
    private func loadData() {
        showLoader()
        dataStore.fetchDetails(identifier: "uj6vtukE") { [weak self] result in
            DispatchQueue.main.async {
                self?.hideLoader()
            }
            switch result {
            case .success():
                DispatchQueue.main.async {
                    self?.propertyDetailTableView.reloadData()
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
        view.addSubview(propertyDetailTableView)

        NSLayoutConstraint.activate([
            propertyDetailTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            propertyDetailTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            propertyDetailTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16.0),
            propertyDetailTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])

        propertyDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        propertyDetailTableView.register(PropertyMainViewCell.self,
                                         forCellReuseIdentifier: PropertyMainViewCell.cellIdentifier)
        propertyDetailTableView.register(PropertyAttributeViewCell.self,
                                         forCellReuseIdentifier: PropertyAttributeViewCell.cellIdentifier)
        propertyDetailTableView.register(PropertyDescriptionViewCell.self,
                                         forCellReuseIdentifier: PropertyDescriptionViewCell.cellIdentifier)
        propertyDetailTableView.delegate = self
        propertyDetailTableView.dataSource = self
        propertyDetailTableView.separatorStyle = .none
    }
}
