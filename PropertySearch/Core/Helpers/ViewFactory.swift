//
//  ViewFactory.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-01.
//

import UIKit

final class ViewFactory {
    static func makeSimpleStackView(axis: NSLayoutConstraint.Axis,
                                   spacing: CGFloat = 1,
                                   distribution: UIStackView.Distribution = .fill) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = distribution
        return stackView
    }

    static func makeSimpleLabel(textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.font = font
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    static func makeASimpleUIView(backgroundColor: UIColor = UIColor.white,
                                 cornerRadius: CGFloat = 0.0) -> UIView {
        let newView = UIView()
        newView.backgroundColor = backgroundColor
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.layer.cornerRadius = cornerRadius
        return newView
    }
}
