//
//  UINavigationBarAppearance+App.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-01.
//

import UIKit

extension UINavigationBarAppearance {
    static var defaultAppearance: UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = AppColor.lightGreen
        return appearance
    }
}
