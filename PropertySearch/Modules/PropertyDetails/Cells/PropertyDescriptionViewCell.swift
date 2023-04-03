//
//  DescriptionViewCell.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import UIKit

final class PropertyDescriptionViewCell: UITableViewCell {
    static let cellIdentifier = "DescriptionViewCell"

    private lazy var containerView = ViewFactory.makeASimpleUIView()
    private lazy var descriptionLabel = ViewFactory.makeSimpleLabel(textColor: AppColor.textBlack,
                                                                    font: AppFont.regular(size: 14.0))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configure cell

    func configure(description: String) {
        descriptionLabel.text = description
    }
}

// MARK: Set up view

private extension PropertyDescriptionViewCell {
    func setUpView() {
        contentView.addSubview(containerView)
        containerView.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80.0),

            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20.0),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20.0)
        ])
    }
}
