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
    
    func convertToDateFormate(current: String, convertTo: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = current
        guard let date = dateFormatter.date(from: self) else {
            return self
        }
        dateFormatter.dateFormat = convertTo
        return  dateFormatter.string(from: date)
    }
}
