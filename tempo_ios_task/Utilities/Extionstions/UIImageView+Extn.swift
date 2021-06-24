//
//  UIImageView+Extn.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    func showActivityLoader() {
        var kf = self.kf
        kf.indicatorType = .activity
    }
}

