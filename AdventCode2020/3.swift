//
//  3.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 02/12/2020.
//

import Foundation

func solve3(_ input: String) -> Int {
    let lines = readLinesToChars(input)
    var x = 0
    var trees = 0
    for y in 0..<lines.count {
        if lines[y][x % lines.first!.count] == "#" {
            trees += 1
        }
        x += 3
    }
    return trees
}

// part 2

func travel(_ input: String, _ xStride: Int, _ yStride: Int) -> Int {
    let lines = readLinesToChars(input)
    var x = 0
    var trees = 0
    for y in stride(from: 0, to: lines.count, by: yStride) {
        if lines[y][x % lines.first!.count] == "#" {
            trees += 1
        }
        x += xStride
    }
    return trees
}

func solve3b(_ input: String, _ strides: [(x: Int, y: Int)]) -> Int {
    return strides.reduce(1) { $0 * travel(input, $1.x, $1.y) }
}
