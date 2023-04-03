//
//  AppImageView.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import Kingfisher
import UIKit

final class AppImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setImage(with url: URL?, placeholderImageName: String) {
        kf.setImage(with: url,
                    placeholder: UIImage(named: placeholderImageName),
                    options: [.transition(.fade(1))] )
    }
}
