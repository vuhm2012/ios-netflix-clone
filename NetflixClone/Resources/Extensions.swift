//
//  Extensions.swift
//  NetflixClone
//
//  Created by it on 15/06/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
