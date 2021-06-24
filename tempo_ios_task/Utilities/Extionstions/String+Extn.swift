//
//  String+Extn.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

extension String {
    var safeUrl: String{
        get{
            return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        }
    }
}
