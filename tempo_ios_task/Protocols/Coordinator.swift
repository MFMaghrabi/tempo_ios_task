//
//  Coordinator.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get }
    func start()
}
