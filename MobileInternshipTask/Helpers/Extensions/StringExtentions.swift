//
//  StringExtentions.swift
//  MobileInternshipTask
//
//  Created by Liubov Fedorchuk on 5/4/19.
//  Copyright © 2019 Liubov Fedorchuk. All rights reserved.
//

import Foundation

extension String {
    
    func convertDateFormatAsString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "E, MMM d yyyy HH:mm"
        guard let newDate = date else {
            return ""
        }
        
        let result = dateFormatter.string(from: newDate)
        
        return  result
    }
}
