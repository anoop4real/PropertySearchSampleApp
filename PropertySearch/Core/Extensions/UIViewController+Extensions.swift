//
//  UIViewController+Extensions.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-27.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle,
                                      message: alertMessage,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    func showLoader() {
        LoadingOverlay.shared.showOverlay(view: self.view)
    }

    func hideLoader() {
        LoadingOverlay.shared.hideOverlayView()
    }
}
