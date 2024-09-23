//
//  NumberGenerator.swift
//  YouAreAwesome
//
//  Created by TheForce on 9/22/24.
//

import Foundation


struct NumberGenerator {
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var number: Int
        repeat {
            number = Int.random(in: 0..<upperBounds)
        } while number == lastNumber
        return number
    }
}
