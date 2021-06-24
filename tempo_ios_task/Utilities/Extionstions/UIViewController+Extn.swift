//
//  UIViewController+Extn.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

extension UIViewController {
    /// Hides keyboard of active textField of `UIViewController`.
    func dismissKeyboard(force: Bool = true) {
        view.endEditing(true)
    }
}

