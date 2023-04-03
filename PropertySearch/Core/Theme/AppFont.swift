//
//  AppFont.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-01.
//

import UIKit

final class AppFont {
    static func regular(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    static func bold(size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }
}
