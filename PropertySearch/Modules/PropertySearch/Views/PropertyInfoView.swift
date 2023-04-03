//
//  PropertyInfoView.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import UIKit

final class PropertyInfoView: UIView {
    private lazy var priceLabel = ViewFactory.makeSimpleLabel(textColor: AppColor.textBlack,
                                                              font: AppFont.bold(size: 13.0))
    private lazy var sizeLabel = ViewFactory.makeSimpleLabel(textColor: AppColor.textBlack,
                                                             font: AppFont.bold(size: 13.0))
    private lazy var roomsLabel = ViewFactory.makeSimpleLabel(textColor: AppColor.textBlack,
                                                              font: AppFont.bold(size: 13.0))
    private lazy var containerStackView = ViewFactory.makeSimpleStackView(axis: .horizontal,
                                                                          distribution: .fillProportionally)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configure view
    func configure(formattedPrice: String,
                   formattedLivingArea: String,
                   formattedNumberOfRooms: String) {
        priceLabel.text = formattedPrice
        sizeLabel.text = formattedLivingArea
        roomsLabel.text = formattedNumberOfRooms
    }

}

private extension PropertyInfoView {
    // MARK: Setup UI
    private func setUpView() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(priceLabel)
        containerStackView.addArrangedSubview(sizeLabel)
        containerStackView.addArrangedSubview(roomsLabel)

        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            priceLabel.widthAnchor.constraint(equalTo: containerStackView.widthAnchor, multiplier: 0.50),
            sizeLabel.widthAnchor.constraint(equalTo: containerStackView.widthAnchor, multiplier: 0.30),
            roomsLabel.widthAnchor.constraint(equalTo: containerStackView.widthAnchor, multiplier: 0.20)

        ])

        roomsLabel.textAlignment = .right
    }
}
