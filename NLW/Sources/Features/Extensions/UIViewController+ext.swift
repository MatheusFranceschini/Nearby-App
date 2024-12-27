//
//  UIViewController+ext.swift
//  NLW
//
//  Created by Matheus Franceschini on 15/12/24.
//

import Foundation
import UIKit

extension UIViewController {
    func setupContentViewToViewController(contentView: UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
