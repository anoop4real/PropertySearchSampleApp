//
//  PropertyViewCell.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-01.
//

import UIKit

final class PropertyViewCell: UITableViewCell {
    static let cellIdentifier = "PropertyViewCell"

    private lazy var containerView = ViewFactory.makeASimpleUIView()
    private lazy var propertyImageView = AppImageView(frame: .zero)
    private lazy var propertyInfoStackView = ViewFactory.makeSimpleStackView(axis: .vertical,
                                                                             spacing: 5.0)
    private lazy var propertyInfoView = PropertyInfoView()
    private lazy var addressLine1Label = ViewFactory.makeSimpleLabel(textColor: AppColor.textBlack,
                                                                      font: AppFont.bold(size: 16.0))
    private lazy var addressLine2Label = ViewFactory.makeSimpleLabel(textColor: AppColor.lightGrey,
                                                                    font: AppFont.regular(size: 12.0))

    private lazy var propertyImageViewHeightConstraint = propertyImageView.heightAnchor.constraint(
        equalToConstant: 150.0)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        propertyImageView.image = UIImage(systemName: Constants.ImageNames.imagePlaceHolder)
        propertyImageView.layer.borderWidth = 0.0
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Cell Configurations

    func configure(property: PropertyViewModel, isHiglighted: Bool = false) {
        addressLine1Label.text = property.addressline1
        addressLine2Label.text = property.addressline2
        propertyInfoView.configure(formattedPrice: property.price,
                                   formattedLivingArea: property.livingArea,
                                   formattedNumberOfRooms: property.numberOfRooms)

        propertyImageView.setImage(with: property.imageURL,
                                   placeholderImageName: Constants.ImageNames.imagePlaceHolder)
        if isHiglighted {
            propertyImageView.layer.borderWidth = 3.0
            propertyImageView.layer.borderColor = AppColor.golden.cgColor
            propertyImageViewHeightConstraint.constant = 200.0
            layoutIfNeeded()
        }
    }
}

private extension PropertyViewCell {
    private func setUpView() {
        contentView.addSubview(containerView)
        containerView.addSubview(propertyImageView)
        containerView.addSubview(propertyInfoStackView)

        propertyInfoView.translatesAutoresizingMaskIntoConstraints = false
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

        propertyInfoStackView.addArrangedSubview(addressLine1Label)
        propertyInfoStackView.addArrangedSubview(addressLine2Label)
        propertyInfoStackView.addArrangedSubview(propertyInfoView)
        propertyImageView.contentMode = .scaleAspectFill
        propertyImageView.clipsToBounds = true
    }
}
