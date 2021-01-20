//
//  Array.swift
//  Memorize
//
//  Created by Illya Sirosh on 20.01.2021.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(of element: Element) -> Int? {
        firstIndex {
            element.id == $0.id
        }
    }
}
