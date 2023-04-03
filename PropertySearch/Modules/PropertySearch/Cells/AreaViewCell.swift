//
//  AreaViewCell.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-01.
//

import UIKit

final class AreaViewCell: UITableViewCell {
    static let cellIdentifier = "AreaViewCell"
    private let placeholderImageName = Constants.ImageNames.imagePlaceHolder
    private lazy var containerView = ViewFactory.makeASimpleUIView()
    private lazy var areaImageView = AppImageView(frame: .zero)
    private lazy var areaDetailsStackView = ViewFactory.makeSimpleStackView(axis: .vertical)
    private lazy var titleLabel = ViewFactory.makeSimpleLabel(textColor: .black,
                                                              font: AppFont.bold(size: 18.0))
    private lazy var areaLabel = ViewFactory.makeSimpleLabel(textColor: .black,
                                                             font: AppFont.bold(size: 12.0))
    private lazy var ratingLabel = ViewFactory.makeSimpleLabel(textColor: .black,
                                                               font: AppFont.regular(size: 11.0))
    private lazy var averagePriceLabel = ViewFactory.makeSimpleLabel(textColor: .black,
                                                                     font: AppFont.regular(size: 11.0))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configure cell

    func configure(area: AreaViewModel) {
        titleLabel.text = area.title
        ratingLabel.text = area.rating
        areaLabel.text = area.area
        averagePriceLabel.text = area.averagePrice
        areaImageView.setImage(with: area.imageURL,
                               placeholderImageName: placeholderImageName)
    }
}

private extension AreaViewCell {
    private func setUpView() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(areaImageView)
        containerView.addSubview(areaDetailsStackView)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 150.0),

            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 5.0),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 20.0),

            areaImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5.0),
            areaImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 5.0),
            areaImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            areaImageView.heightAnchor.constraint(equalToConstant: 150.0),

            areaDetailsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5.0),
            areaDetailsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5.0),
            areaDetailsStackView.topAnchor.constraint(equalTo: areaImageView.bottomAnchor, constant: 5.0),
            areaDetailsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5.0)

        ])

        areaDetailsStackView.addArrangedSubview(areaLabel)
        areaDetailsStackView.addArrangedSubview(ratingLabel)
        areaDetailsStackView.addArrangedSubview(averagePriceLabel)
        areaImageView.contentMode = .scaleAspectFill
        areaImageView.clipsToBounds = true
    }
}
