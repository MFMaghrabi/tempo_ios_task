//
//  Alertable.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import Foundation
import UIKit
import AudioToolbox

/// Defines protocol for presenting `UIAlertController`.
protocol Alertable {
    /// Defines method for presenting `UIAlertController`.
    func presentAlert(title: String?, message: String?, defaultButtonTitle: String?, appendSecondAction: Bool?, completion: (() -> Void)?)
}

extension UIViewController:  Alertable {}


extension Alertable where Self: UIViewController {
    
    func presentAlert(title: String?, message: String?, defaultButtonTitle: String? = "okay", appendSecondAction: Bool? = false, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: defaultButtonTitle, style: .destructive, handler: { (action) in
            if #available(iOS 13.0, *) {
                UIImpactFeedbackGenerator(style: .soft).impactOccurred()
            } else {
                // Fallback on earlier versions
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            }
            completion?()
        }))
        
        if appendSecondAction == true {
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
                if #available(iOS 13.0, *) {
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                } else {
                    // Fallback on earlier versions
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }
            }))
        }
        present(alertController, animated: true, completion: nil)
    }
}

