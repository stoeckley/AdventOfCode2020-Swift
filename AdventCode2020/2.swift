//
//  2.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 02/12/2020.
//

import Foundation

func solve2(_ input: String) -> Int {
    return readLinesSplitSpaces(input).filter { line in
        let minmax = line[0].split(separator: "-")
        let count = line[2].filter { $0 == line[1].first! }.count
        return count >= Int(minmax[0])! && count <= Int(minmax[1])!
    }.count
}

// part 2

func solve2b(_ input: String) -> Int {
    return readLinesSplitSpaces(input).filter { line in
        let minmax = line[0].split(separator: "-")
        let password = Array(line[2])
        let letter = line[1].first!
        let foundMin = password[Int(minmax[0])!-1] == letter
        let foundMax = password[Int(minmax[1])!-1] == letter
        return (foundMin && !foundMax) || (!foundMin && foundMax)
    }.count
}
