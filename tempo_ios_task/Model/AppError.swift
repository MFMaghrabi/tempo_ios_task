//
//  AppError.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import Foundation

struct AppError: Error {
    var errorMessage : String = AppConstants.errorMessage
    var errorId: Int = 0
}
