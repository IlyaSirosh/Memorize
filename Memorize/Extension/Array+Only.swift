//
//  Array+Only.swift
//  Memorize
//
//  Created by Illya Sirosh on 21.01.2021.
//

import Foundation

extension Array {
    
    var only: Element? {
        count == 1 ? first : nil
    }
    
}
