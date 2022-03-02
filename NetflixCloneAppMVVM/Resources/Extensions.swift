//
//  Extensions.swift
//  NetflixCloneAppMVVM
//
//  Created by Américo MQ on 02/03/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
