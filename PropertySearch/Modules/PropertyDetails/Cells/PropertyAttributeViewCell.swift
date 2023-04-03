//
//  PropertyAttributeViewCell.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import UIKit

final class PropertyAttributeViewCell: UITableViewCell {
    static let cellIdentifier = "PropertyAttributeViewCell"

    private lazy var containerView = ViewFactory.makeASimpleUIView()
    private lazy var attributeValueLabel = ViewFactory.makeSimpleLabel(textColor: AppColor.textBlack,
                                                                       font: AppFont.regular(size: 14.0))
    private lazy var attributeKeyLabel = ViewFactory.makeSimpleLabel(textColor: AppColor.textBlack,
                                                                     font: AppFont.bold(size: 14.0))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configure cell

    func configure(attribute: PropertyAttribute) {
        attributeValueLabel.text = attribute.attributeValue
        attributeKeyLabel.text = "\(attribute.attributeKey):"
    }
}

// MARK: Set up view

private extension PropertyAttributeViewCell {
    func setUpView() {
        contentView.addSubview(containerView)
        containerView.addSubview(attributeValueLabel)
        containerView.addSubview(attributeKeyLabel)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 30.0),

            attributeKeyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            attributeKeyLabel.trailingAnchor.constraint(equalTo: attributeValueLabel.leadingAnchor, constant: -8.0),
            attributeKeyLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            attributeKeyLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            attributeValueLabel.centerYAnchor.constraint(equalTo: attributeKeyLabel.centerYAnchor)

        ])
    }
}
