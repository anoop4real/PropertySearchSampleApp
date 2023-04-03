//
//  LoadingOverlay.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-27.
//

import Foundation

import UIKit
/// A helper class to show loading indicator for long running tasks
final class LoadingOverlay {
    private lazy var overlayView = makeASimpleUIView(backgroundColor: UIColor.black, cornerRadius: 10.0)
    private lazy var bgView = makeASimpleUIView(backgroundColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5))
    private lazy var hintlabel = makeSimpleLabel(textColor: UIColor.white, font: UIFont.boldSystemFont(ofSize: 20.0))
    private var activityIndicator = UIActivityIndicatorView()

    private weak var parentView: UIView!

    private var isVisible = false
    private init() {}

    private static let _shared = LoadingOverlay()
    class var shared: LoadingOverlay {
        return _shared
    }

    public func showOverlay(view: UIView, hint: String = "") {
        if !isVisible {
            parentView = view
            parentView.addSubview(bgView)
            bgView.addSubview(overlayView)
            bgView.addSubview(hintlabel)
            overlayView.addSubview(activityIndicator)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate(
                [
                    bgView.topAnchor.constraint(equalTo: parentView.topAnchor),
                    bgView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
                    bgView.leftAnchor.constraint(equalTo: parentView.leftAnchor),
                    bgView.rightAnchor.constraint(equalTo: parentView.rightAnchor),

                    overlayView.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
                    overlayView.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
                    overlayView.widthAnchor.constraint(equalToConstant: 80.0),
                    overlayView.heightAnchor.constraint(equalToConstant: 80.0),

                    hintlabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
                    hintlabel.centerYAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: 40),
                    hintlabel.heightAnchor.constraint(equalToConstant: 40.0),

                    activityIndicator.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
                    activityIndicator.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor)
                ]
            )
            hintlabel.text = hint
            activityIndicator.style = UIActivityIndicatorView.Style.large
            activityIndicator.color = .white
            activityIndicator.startAnimating()
            isVisible = true
        } else {
            hintlabel.text = hint
        }
    }

    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        if parentView != nil {
            if parentView.subviews.contains(bgView) {
                bgView.removeFromSuperview()
                isVisible = false
            }
        }
        hintlabel.text = ""
        isVisible = false
    }
}

extension LoadingOverlay {

    private func makeASimpleUIView(backgroundColor: UIColor = UIColor.white, cornerRadius: CGFloat = 0.0) -> UIView {
        let newView = UIView()
        newView.backgroundColor = backgroundColor
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.layer.cornerRadius = cornerRadius
        return newView
    }

    private func makeSimpleLabel(textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.font = font
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
