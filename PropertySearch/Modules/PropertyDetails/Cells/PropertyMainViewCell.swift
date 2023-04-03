//
//  PropertyMainViewCell.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import UIKit

final class PropertyMainViewCell: UITableViewCell {
    static let cellIdentifier = "PropertyMainViewCell"

    private lazy var containerView = ViewFactory.makeASimpleUIView()
    private lazy var propertyImageView = AppImageView(frame: .zero)

    private lazy var propertyInfoStackView = ViewFactory.makeSimpleStackView(axis: .vertical,
                                                                             spacing: 5.0)
    private lazy var streetAddressLabel = ViewFactory.makeSimpleLabel(textColor: AppColor.textBlack,
                                                                      font: AppFont.bold(size: 20.0))
    private lazy var addressLineLabel = ViewFactory.makeSimpleLabel(textColor: AppColor.lightGrey,
                                                                    font: AppFont.regular(size: 13.0))
    private lazy var askingPriceLabel = ViewFactory.makeSimpleLabel(textColor: AppColor.textBlack,
                                                                    font: AppFont.bold(size: 15.0))
    private lazy var propertyImageViewHeightConstraint = propertyImageView.heightAnchor.constraint(
        equalToConstant: 300.0)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    func configure(addressLine1: String,
                   addressLine2: String,
                   askingPrice: String,
                   imageURL: URL?) {
        streetAddressLabel.text = addressLine1
        addressLineLabel.text = addressLine2
        askingPriceLabel.text = askingPrice
        propertyImageView.setImage(with: imageURL,
                                   placeholderImageName: Constants.ImageNames.imagePlaceHolder)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PropertyMainViewCell {
    func setUpView() {
        contentView.addSubview(containerView)
        containerView.addSubview(propertyImageView)
        containerView.addSubview(propertyInfoStackView)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150.0),

            propertyImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5.0),
            propertyImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5.0),
            propertyImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20.0),
            propertyImageViewHeightConstraint,

            propertyInfoStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5.0),
            propertyInfoStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5.0),
            propertyInfoStackView.topAnchor.constraint(equalTo: propertyImageView.bottomAnchor, constant: 15.0),
            propertyInfoStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5.0)

        ])

        propertyInfoStackView.addArrangedSubview(streetAddressLabel)
        propertyInfoStackView.addArrangedSubview(addressLineLabel)
        propertyInfoStackView.addArrangedSubview(askingPriceLabel)
        propertyImageView.contentMode = .scaleAspectFill
        propertyImageView.clipsToBounds = true
    }
}
