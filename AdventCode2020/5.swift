//
//  5.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 05/12/2020.
//

import Foundation

func search(code: String, low: Int, high: Int, frontCode: Character) -> Int {
    code.reduce((low,high)) { interval, char in
        let (low,high) = interval
        let mid = low + (high - low) / 2
        return char == frontCode ? (low, mid) : (mid + 1, high)
    }.0
}

func findSeat(_ code: String) -> Int {
    let row = search(code: String(code.prefix(7)), low: 0, high: 127, frontCode: "F")
    let column = search(code: String(code.suffix(3)), low: 0, high: 7, frontCode: "L")
    return 8 * row + column
}

func solve5(_ input: String) -> Int {
    return input.split(separator: "\n").reduce(0) {
        high, code in
        max(high,findSeat(String(code)))
    }
}

// part 2

func solve5b(_ input: String) -> Int {
    let seats = Set(input.split(separator: "\n")).map { findSeat(String($0)) }
    return (seats.min()!...seats.max()!).filter {
        !(seats.contains($0))
    }.first!
}
