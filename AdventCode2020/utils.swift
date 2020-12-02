//
//  utils.swift
//  AdventCode2020
//
//  Created by Andrew Stoeckley on 01/12/2020.
//

import Foundation

func readLines(_ input: String) -> [Substring] {
    return input.split(separator: "\n")
}

func readLinesSplitSpaces(_ input: String) -> [[Substring]] {
    let lines = readLines(input)
    var output = [[Substring]]()
    for line in lines {
        output.append(line.split(separator: " "))
    }
    return output
}
